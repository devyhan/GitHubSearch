//
//  OptionalInject.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

/// A property wrapper (SE-0258) to make a `Optional<Component>` injectable
/// through `@OptionalInject var variableName: Component?`. Lazy by default.
@propertyWrapper
public enum OptionalInject<Component> {
    case unresolved(() -> Component?)
    case resolved(Component?)

    public init() {
        self = .unresolved({ resolveOptional() })
    }

    public init(tag: AnyHashable? = nil) {
        self = .unresolved({ resolveOptional(tag: tag) })
    }

    public var wrappedValue: Component? {
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
