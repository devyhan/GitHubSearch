//
//  ComponentProtocol.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

public protocol ComponentProtocol {
    var lifetime: Lifetime { get }
    var identifier: AnyHashable { get }
    var componentFactory: ComponentFactory { get }
    var type: Any.Type { get }
}
