//
//  DependencyContainer.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

import Foundation

public final class DependencyContainer {
    // MARK: - Typealiases
    public typealias BootstrapBlock = (DependencyContainer) -> Void
    internal typealias ComponentStack = [AnyHashable: ComponentProtocol]
    internal typealias InstanceStack = [AnyHashable: Any]

    // MARK: - Properties
    internal var bootstrapped = false
    internal var componentStack = ComponentStack()
    internal var instanceStack = InstanceStack()
    private let lock = NSRecursiveLock()

    internal static var root: DependencyContainer?
    public static var shared: DependencyContainer {
        guard let root = DependencyContainer.root else {
            fatalError("`root` DependencyContainer is not yet set.")
        }
        return root
    }

    // MARK: - Public methods
    /// Derives a `DependencyContainer` from multiple sub containers.
    ///
    /// - Parameters:
    ///     - from: *DependencyContainer...* to derive the final `DependencyContainer` from.
    ///
    /// - Returns: The final `DependencyContainer`.
    public static func derive(from containers: DependencyContainer...) -> DependencyContainer {
        return DependencyContainer(containers.reduce(into: ComponentStack()) { (result, container) in
            result.merge(container.componentStack) { (old, new) -> ComponentProtocol in
                fatalError("A `Component` was declared at least twice `\(old)` -> `\(new)`.")
            }
        })
    }

    /// Derives a `DependencyContainer` from multiple sub containers.
    ///
    /// - Parameters:
    ///     - from: *[DependencyContainer]* to derive the final `DependencyContainer` from.
    ///
    /// - Returns: The final `DependencyContainer`.
    public static func derive(from containers: [DependencyContainer]) -> DependencyContainer {
        return DependencyContainer(containers.reduce(into: ComponentStack()) { (result, container) in
            result.merge(container.componentStack) { (old, new) -> ComponentProtocol in
                fatalError("A `Component` was declared at least twice `\(old)` -> `\(new)`.")
            }
        })
    }

    /// Creates the `DependencyContainer`.
    ///
    /// - Parameters:
    ///     - boostrapBlock: The *boostrapBlock* is a closure `(DependencyContainer)
    ///                       -> Void` for registering all `[Component]`.
    public init(boostrapBlock: BootstrapBlock) {
        threadSafe {
            boostrapBlock(self)
            self.bootstrapped = true
        }
    }

    // MARK: - Internal methods
    init(_ componentStack: ComponentStack) {
        self.componentStack = componentStack
        self.bootstrapped = true
    }

    func threadSafe(_ closure: () -> ()) {
        lock.lock()
        defer {
            lock.unlock()
        }
        return closure()
    }
}

extension DependencyContainer {
    /// Defines the used `DependencyContainer` root for resolving components.
    /// Can can be statically resolved for injection.
    ///
    /// - Parameters:
    ///     - by: *DependencyContainer* the root `DependencyContainer`
    public static func defined(by root: DependencyContainer) {
        guard self.root == nil else {
            fatalError("It is not allowed to override the `root` DependencyContainer at runtime.")
        }
        self.root = root
    }
}

extension DependencyContainer {
    /// Registers a `Component`.
    ///
    /// - Parameters:
    ///     - lifetime: The *scope* of the `Component`, defaults to `Lifetime.singleton`.
    ///     - factory: The *factory* for the initialization of the `Component`.
    public func register<T>(lifetime: Lifetime = .singleton, _ factory: @escaping () -> T) {
        let component = Component(lifetime: lifetime, factory: factory)
        register(component)
    }

    /// Registers a `Component`
    ///
    /// - Parameters:resolve
    ///   - lifetime: The *scope* of the `Component`, defaults to `Lifetime.singleton`.
    ///   - tag: A *tag* for the `Component` used to identify it.
    ///   - factory: The *factory* for the initialization of the `Component`.
    public func register<T>(lifetime: Lifetime = .singleton, tag: AnyHashable, _ factory: @escaping () -> T) {
        let component = Component(lifetime: lifetime, tag: tag, factory: factory)
        register(component)
    }

    public func register(_ component: ComponentProtocol) {
        precondition(!bootstrapped, "After boostrap no more components can be registered.")
        threadSafe {
            guard self.componentStack[component.identifier] == nil else {
                fatalError("A component can only be registered once.")
            }
            self.componentStack[component.identifier] = component
        }
    }
}

extension DependencyContainer {
    /// Resolves nil safe a `Component<T>`.
    ///
    /// - Parameter tag: An optional *tag* to identify the Component. `nil` per default.
    /// - Returns: The resolved `Optional<Component<T>>`.
    func _resolve<T>(tag: AnyHashable? = nil) -> T? {
        let identifier = ComponentIdentifier(tag: tag, type: T.self)
        guard let foundComponent = self.componentStack[identifier] else {
            return nil
        }
        if foundComponent.lifetime == .factory {
            return foundComponent.componentFactory() as? T
        }
        if let instanceOfComponent = self.instanceStack[identifier] as? T {
            return instanceOfComponent
        }
        let instance = foundComponent.componentFactory() as! T
        self.instanceStack[identifier] = instance
        return instance
    }

    /// Checks whether `Component<T>` is resolvable by looking it up in the
    /// `componentStack`.
    ///
    /// - Parameters:
    ///     - type: The generic *type* of the `Component`.
    ///     - tag: An optional *tag* to identify the Component. `nil` per default.
    ///
    /// - Returns: `Bool` whether `Component<T>` is resolvable or not.
    func resolvable<T>(type: T.Type, tag: AnyHashable? = nil) -> Bool {
        let identifier = ComponentIdentifier(tag: tag, type: T.self)
        return self.componentStack[identifier] != nil
    }

    /// Resolves a `Component<T>`.
    /// Implicitly assumes that the `Component` can be resolved.
    /// Throws a fatalError if the `Component` is not registered.
    ///
    /// - Parameter tag: An optional *tag* to identify the Component. `nil` per default.
    ///
    /// - Returns: The resolved `Component<T>`.
    public func resolve<T>(tag: AnyHashable? = nil) -> T {
        if let t: T = _resolve(tag: tag) {
            return t
        }
        fatalError("Component `\(String(describing: T.self))` could not be resolved.")
    }
}
