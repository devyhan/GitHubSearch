//
//  ContainerContext.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

/// Exposes the `DependencyContainer` through for instance `AppDelegate`.
public protocol ContainerContext {
    var container: DependencyContainer { get }
}
