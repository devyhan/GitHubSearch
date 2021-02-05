//
//  CriptoDefault.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import Foundation

/**
 ```swift
 enum UserDefault {
   @UserDefaultWrapper(key: "Key", defaultValue: false)
   static var isLoggedIn: Bool
 }
 
 ...
 
 UserDefault.isLoggedIn         // set defaultValue
 UserDefault.isLoggedIn = true  // get value
 UserDefault.isLoggedIn         // set true
 ```
 */

enum Key: String {
    case accessToken = "x-access-token"
    case refreshToken = "x-refresh-token"
}

enum UserDefault {
    @UserDefaultWrapper(key: Key.accessToken.rawValue, defaultValue: "")
    static var token: String
    
    @UserDefaultWrapper(key: Key.refreshToken.rawValue, defaultValue: "")
    static var refreshToken: String
}

@propertyWrapper
struct UserDefaultWrapper<T> {
    let key: String
    let defaultValue: T
    let `default` = UserDefaults.standard
    
    var wrappedValue: T {
        get { `default`.object(forKey: key) as? T ?? defaultValue }
        set { `default`.set(newValue, forKey: key) }
    }
    
    static func hashItem(item: String) -> Int {
        var hasher = Hasher()
        item.hash(into: &hasher)
        return hasher.finalize()
    }
}
