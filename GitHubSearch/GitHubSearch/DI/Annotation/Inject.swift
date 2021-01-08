//
//  Inject.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

/// A property wrapper (SE-0258) to make a `Component` eagerly injectable
/// through `@Inject var variableName: Component`.
@propertyWrapper
public struct Inject<Component> {
    public let wrappedValue: Component

    public init() {
        self.wrappedValue = resolve()
    }

    public init(tag: AnyHashable? = nil) {
        self.wrappedValue = resolve(tag: tag)
    }
}
