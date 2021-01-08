//
//  ObservedInject.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

import SwiftUI

/// A property wrapper (SE-0258) to make a `Component` inherited from ObservableObject
/// through `@ObservedInject var variableName: ObservableObject`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper
public struct ObservedInject<Component: ObservableObject>: DynamicProperty {
    @ObservedObject public var wrappedValue: Component
    
    public var projectedValue: ObservedObject<Component>.Wrapper {
        return self._wrappedValue.projectedValue
    }

    public init() {
        self.wrappedValue = resolve()
    }

    public init(tag: AnyHashable? = nil) {
        self.wrappedValue = resolve(tag: tag)
    }
}
