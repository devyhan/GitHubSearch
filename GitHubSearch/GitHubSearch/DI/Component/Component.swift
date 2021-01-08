//
//  Component.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

public typealias ComponentFactory = () -> Any

class Component<T>: ComponentProtocol {
    let lifetime: Lifetime
    let identifier: AnyHashable
    let type: Any.Type
    let componentFactory: ComponentFactory

    init(lifetime: Lifetime, factory: @escaping () -> T) {
        self.lifetime = lifetime
        self.identifier = ComponentIdentifier(type: T.self)
        self.type = T.self
        self.componentFactory = { factory() }
    }

    init(lifetime: Lifetime, tag: AnyHashable, factory: @escaping () -> T) {
        self.lifetime = lifetime
        self.identifier = ComponentIdentifier(tag: tag, type: T.self)
        self.type = T.self
        self.componentFactory = { factory() }
    }
}
