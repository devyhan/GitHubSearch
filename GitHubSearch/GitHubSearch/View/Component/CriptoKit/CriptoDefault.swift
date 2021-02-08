//
//  CriptoDefault.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import Foundation
import CryptoKit
import Security

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
    @KeychainItem(account: Bundle.bundleIdentifier)
    var keyChain: String?
    
    let key: String
    let defaultValue: String
    let `default` = UserDefaults.standard
    var values: String?
    
    var wrappedValue: String {
        get { isDecryptedData(key: key) } // get in - string
        set { `default`.set(isEncryptedData(data: newValue), forKey: key) } // set in - string / isHashingData()
    }
    
    private func isEncryptedData(data: String) -> Data {
        let data = Data(data.utf8) // userdefault에 들어온 값
        let symmetricKey = SymmetricKey(size: .bits256)
        keyChain = symmetricKey.withUnsafeBytes { Data(Array($0)).base64EncodedString() } // 키체인에 string타입으로 저장하기 위함
        let sealedBoxData = try! ChaChaPoly.seal(data, using: symmetricKey).combined
        
        return sealedBoxData
    }
 
    private func isDecryptedData(key: String) -> String {
        guard let _keyData = Data(base64Encoded: keyChain ?? "") else { return "" } // 다시 SymmetricKey타입으로 만들기위해 Data타입저장
        let data = `default`.object(forKey: key) as! Data
        let sealedBox = try! ChaChaPoly.SealedBox(combined: data)
        let _retrievedKey = SymmetricKey(data: _keyData)
        let decryptedData = try! ChaChaPoly.open(sealedBox, using: _retrievedKey)
        
        return String(decoding: decryptedData, as: UTF8.self)
    }
}

private func throwIfNotZero(_ status: OSStatus) throws {
    guard status != 0 else { return }
    throw KeychainError.keychainError(status: status)
}

public enum KeychainError: Error {
    case invalidData
    case keychainError(status: OSStatus)
}

extension Dictionary {
    func adding(key: Key, value: Value) -> Dictionary {
        var copy = self
        copy[key] = value
        return copy
    }
}

@propertyWrapper
final public class KeychainItem {
    private let service: String
    
    public init(account: String) {
        self.service = account
    }
    
    private var baseDictionary: [String: AnyObject] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject
        ]
    }
    
    private var query: [String:AnyObject] {
        return baseDictionary.adding(key: kSecMatchLimit as String, value: kSecMatchLimitOne)
    }
    
    public var wrappedValue: String? {
        get {
            try! read()
        }
        set {
            if let value = newValue {
                if try! read() == nil {
                    try! add(value)
                } else {
                    try! update(value)
                }
            } else {
                try! delete()
            }
        }
    }
    
    private func delete() throws {
        // SecItemDelete seems to fail with errSecItemNotFound if the item does not exist in the keychain. Is this expected behavior?
        let status = SecItemDelete(baseDictionary as CFDictionary)
        guard status != errSecItemNotFound else { return }
        try throwIfNotZero(status)
    }
    
    private func read() throws -> String? {
        let query = self.query.adding(key: kSecReturnData as String, value: true as AnyObject)
        var result: AnyObject? = nil
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        guard status != errSecItemNotFound else { return nil }
        try throwIfNotZero(status)
        guard let data = result as? Data, let string = String(data: data, encoding: .utf8) else {
            throw KeychainError.invalidData
        }
        return string
    }
    
    private func update(_ secret: String) throws {
        let dictionary: [String:AnyObject] = [
            kSecValueData as String: secret.data(using: String.Encoding.utf8)! as AnyObject
        ]
        try throwIfNotZero(SecItemUpdate(baseDictionary as CFDictionary, dictionary as CFDictionary))
    }
    
    private func add(_ secret: String) throws {
        let dictionary = baseDictionary.adding(key: kSecValueData as String, value: secret.data(using: .utf8)! as AnyObject)
        try throwIfNotZero(SecItemAdd(dictionary as CFDictionary, nil))
    }
}
