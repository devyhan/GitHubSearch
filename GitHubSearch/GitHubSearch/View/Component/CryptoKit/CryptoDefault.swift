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
    @CryptoDefaultWrapper(key: Key.accessToken.rawValue, defaultValue: "")
    static var token: String
    
    @CryptoDefaultWrapper(key: Key.refreshToken.rawValue, defaultValue: "")
    static var refreshToken: String
}

@propertyWrapper
struct CryptoDefaultWrapper {
    @KeychainWrapper(account: Bundle.bundleIdentifier)
    var keyChain: String?
    
    let key: String
    let defaultValue: String
    let `default` = UserDefaults.standard
    var values: String?
    
    var wrappedValue: String {
        get { isDecryptedData(key: key) } // userdefault에 저장된 암호화된 데이터를 string으로 출력
        set { `default`.set(isEncryptedData(data: newValue), forKey: key) } // String을 받아와 userdefault에 암호화 데이터 저장
    }
    
    private func isEncryptedData(data: String) -> Data {
        let data = Data(data.utf8) // userdefault에 들어온 값
        let symmetricKey = SymmetricKey(size: .bits256) // SymmetricKey 발급
        let sealedBoxData = try! ChaChaPoly.seal(data, using: symmetricKey).combined
        
        keyChain = symmetricKey.withUnsafeBytes { Data(Array($0)).base64EncodedString() } // SymmetricKey를 키체인에 string타입으로 저장하기 위함
        
        return sealedBoxData
    }
 
    private func isDecryptedData(key: String) -> String {
        guard let keyData = Data(base64Encoded: keyChain ?? "") else { return "" } // 다시 SymmetricKey타입으로 만들기위해 Data타입저장
        let data = `default`.object(forKey: key) as! Data
        let sealedBox = try! ChaChaPoly.SealedBox(combined: data)
        let retrievedKey = SymmetricKey(data: keyData)
        let decryptedData = try! ChaChaPoly.open(sealedBox, using: retrievedKey)
        
        return String(decoding: decryptedData, as: UTF8.self)
    }
}
