//
//  ComponentIdentifier.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/08.
//

struct ComponentIdentifier: Hashable {
    let tag: AnyHashable?
    let type: Any.Type

    func hash(into hasher: inout Hasher) {
        hasher.combine(String(describing: type))
        if let tag = tag {
            hasher.combine(tag)
        }
    }

    static func == (lhs: ComponentIdentifier, rhs: ComponentIdentifier) -> Bool {
        lhs.type == rhs.type && lhs.tag == rhs.tag
    }
}

extension ComponentIdentifier {
    init(type: Any.Type) {
        self.type = type
        self.tag = nil
    }
}
