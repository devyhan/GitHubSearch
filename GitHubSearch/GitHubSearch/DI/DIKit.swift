//
//  DIKit.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

/// Resolves given `Component<T>`.
///
/// - Parameter tag: An optional *tag* to identify the Component. `nil` per default.
/// - Returns: The resolved `Component<T>`.
public func resolve<T>(tag: AnyHashable? = nil) -> T { DependencyContainer.shared.resolve(tag: tag) }

/// Resolves nil safe given `Component<T>`.
///
/// - Parameter tag: An optional *tag* to identify the Component. `nil` per default.
/// - Returns: The resolved `Optional<Component<T>>`.
public func resolveOptional<T>(tag: AnyHashable? = nil) -> T? {
    guard DependencyContainer.shared.resolvable(type: T.self, tag: tag) else { return nil }
    return DependencyContainer.shared._resolve(tag: tag)
}

@_functionBuilder
public struct ModuleBuilder {
    public static func buildBlock(_ children: [ComponentProtocol]...) -> [ComponentProtocol] {
        children.flatMap { $0 }
    }

    public static func buildBlock(_ component: [ComponentProtocol]) -> [ComponentProtocol] {
        component
    }
}

public func module(@ModuleBuilder makeChildren: () -> [ComponentProtocol]) -> DependencyContainer {
    DependencyContainer { container in makeChildren().forEach { c in container.register(c) } }
}

@_functionBuilder
public struct ModulesBuilder {
    public static func buildBlock(_ children: DependencyContainer...) -> [DependencyContainer] {
        children.compactMap { $0 }
    }

    public static func buildBlock(_ component: DependencyContainer) -> [DependencyContainer] {
        [component]
    }
}

public func modules(@ModulesBuilder makeChildren: () -> [DependencyContainer]) -> DependencyContainer {
    DependencyContainer.derive(from: makeChildren())
}

public func resolvable<T>(lifetime: Lifetime = .singleton, _ factory: @escaping () -> T) -> ComponentProtocol {
    Component(lifetime: lifetime, factory: factory) as ComponentProtocol
}

public func resolvable<T>(
    lifetime: Lifetime = .singleton,
    tag: AnyHashable,
    _ factory: @escaping () -> T
) -> ComponentProtocol {
    Component(lifetime: lifetime, tag: tag, factory: factory) as ComponentProtocol
}

public func factory<T>(factory: @escaping () -> T) -> [ComponentProtocol] {
    [resolvable(lifetime: .factory, factory)]
}

public func factory<T>(tag: AnyHashable, factory: @escaping () -> T) -> [ComponentProtocol] {
    [resolvable(lifetime: .factory, tag: tag, factory)]
}

public func single<T>(factory: @escaping () -> T) -> [ComponentProtocol] {
    [resolvable(lifetime: .singleton, factory)]
}

public func single<T>(tag: AnyHashable, factory: @escaping () -> T) -> [ComponentProtocol] {
    [resolvable(lifetime: .singleton, tag: tag, factory)]
}
