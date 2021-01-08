//
//  LazyInject.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

/// A property wrapper (SE-0258) to make a `Component` lazily injectable
/// through `@LazyInject var variableName: Component`.
@propertyWrapper
public enum LazyInject<Component> {
    case unresolved(() -> Component)
    case resolved(Component)

    public init() {
        self = .unresolved({ resolve() })
    }

    public init(tag: AnyHashable? = nil) {
        self = .unresolved({ resolve(tag: tag) })
    }

    public var wrappedValue: Component {
        mutating get {
            switch self {
            case .unresolved(let resolver):
                let component = resolver()
                self = .resolved(component)
                return component
            case .resolved(let component):
                return component
            }
        }
    }
}
