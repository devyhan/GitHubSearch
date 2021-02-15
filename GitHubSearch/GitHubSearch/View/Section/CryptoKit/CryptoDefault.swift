//
//  CriptoDefault.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import Foundation
import CryptoKit

enum Key: String {
    case accessToken = "x-access-token"
    case refreshToken = "x-refresh-token"
}

enum CryptoDefault {
    @CryptoDefaultWrapper(userDefaultKey: Key.accessToken.rawValue, defaultValue: "")
    static var token: String
    
    @CryptoDefaultWrapper(userDefaultKey: Key.refreshToken.rawValue, defaultValue: "")
    static var refreshToken: String
}

enum CipherError: Error {
    case encrypted
    case decrypted
}

@propertyWrapper
struct CryptoDefaultWrapper {
    let userDefaultKey: String
    let defaultValue: String
    let `default` = UserDefaults.standard
    
    var wrappedValue: String {
        get { isDecryptedData(key: userDefaultKey) }
        set { `default`.set(isEncryptedData(data: newValue), forKey: userDefaultKey) }
    }
    
    private func isEncryptedData(data: String) -> Data {
        guard let keyData = Data(base64Encoded: Keychain.symmetricKey ?? "") else { return Data() }
        let symmetricKey = SymmetricKey(data: keyData)
        let data = Data(data.utf8)
        
        do {
            let sealedBoxData = try ChaChaPoly.seal(data, using: symmetricKey).combined
            return sealedBoxData
        } catch {
            print("❗️Error \(CipherError.encrypted.localizedDescription)", error)
        }
        
        return Data()
    }
 
    private func isDecryptedData(key: String) -> String {
        guard let keyData = Data(base64Encoded: Keychain.symmetricKey ?? "") else { return "" }
        guard let data = `default`.object(forKey: key) as? Data else { return "" }
        let retrievedKey = SymmetricKey(data: keyData)
        
        do {
            let sealedBox = try ChaChaPoly.SealedBox(combined: data)
            let decryptedData = try ChaChaPoly.open(sealedBox, using: retrievedKey)
            return String(decoding: decryptedData, as: UTF8.self)
        } catch {
            print("❗️Error \(CipherError.decrypted.localizedDescription)", error)
        }
        
        return ""
    }
}
