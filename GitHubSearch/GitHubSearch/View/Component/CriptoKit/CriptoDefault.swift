//
//  CriptoDefault.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import Foundation
import CryptoKit

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

enum CriptoDefault {
    @CriptoDefaultWrapper(key: Key.accessToken.rawValue, defaultValue: "")
    static var token: String
    
    @CriptoDefaultWrapper(key: Key.refreshToken.rawValue, defaultValue: "")
    static var refreshToken: String
}

@propertyWrapper
struct CriptoDefaultWrapper {
    let key: String
    let defaultValue: String
    let `default` = UserDefaults.standard
    
    var wrappedValue: String {
        get { `default`.string(forKey: key) ?? defaultValue }
        set { `default`.set(CriptoDefaultWrapper.isHashingData(item: newValue), forKey: key) }
    }
    
    static func isHashingData(item: String) -> String {
        let hasingData = Data(item.utf8)
        let hased = SHA512.hash(data: hasingData)
        return hased.description
    }
}
