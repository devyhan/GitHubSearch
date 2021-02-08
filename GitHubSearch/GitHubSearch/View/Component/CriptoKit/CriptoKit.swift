//
//  CriptoKit.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import SwiftUI
import CryptoKit


struct CriptoKitExample: View {
    @State var value: String = ""
    @KeychainItem(account: Bundle.bundleIdentifier)
    var keychainValue: String?
    
    var body: some View {
        VStack {
            Text("CriptoDefault")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("\(value)")
                .padding()
                .border(Color.black, width: 1)
                .padding()
        }
        .onAppear {
            CriptoDefault.token = "access token"
            
            print("🔅", UserDefaults.standard.object(forKey: "x-access-token"))
            
            value = CriptoDefault.token
            //
            // Check that the device has a Secure Enclave

            
            //
//            let data = Data("some data".utf8)
//            let key256 = SymmetricKey(size: .bits256) // cryptokit으로 대칭키 생성
            // 일반적으로 사용되는 AEAD는 고급 암호화 표준 Galois / Counter 모드 ( AES-GCM ) 및 ChaCha20-Poly1305 입니다.
            // https://developer.apple.com/documentation/cryptokit/chachapoly
//            print("⛔️", key256.withUnsafeBytes {Data(Array($0)).base64EncodedString()})
//            let savedKey = key256.withUnsafeBytes {Data(Array($0)).base64EncodedString()}
//            if let keyData = Data(base64Encoded: savedKey) {
//                let retrievedKey = SymmetricKey(data: keyData)
//            }
//
//            let sealedBoxData = try! ChaChaPoly.seal(data, using: key256).combined // 데이터 암호화를 위해 data, key 제공
//            // Harry receives sealed box data, then extracts the sealed box
//            let sealedBox = try! ChaChaPoly.SealedBox(combined: sealedBoxData)
//            // Harry decrypts data with the same key
//            let decryptedData = try! ChaChaPoly.open(sealedBox, using: key256)
//            print("key: ", key256)
//            print("key256을 사용한 decrypt")
//            print(decryptedData)
//            // What else is in the box?
//            print(sealedBox.nonce)  // 12 bytes
//            print(sealedBox.tag)  // 16 bytes
//            // encryptedData isn't an image
//            let encryptedData = sealedBox.ciphertext
//            print("encryptedData: ", encryptedData.description)
//            print("decryptedData: ", decryptedData)
//            let someText = String(decoding: decryptedData, as: UTF8.self)
//            print("someText: ", someText)
//            print("encrypted description: ", String(decoding: encryptedData, as: UTF8.self))
//            keychainValue = "key chain value 02"
//            print(keychainValue ?? "none")
//            print(Bundle.bundleIdentifier)
        
        }
        .onDisappear {
            CriptoDefault.token = ""
            print("userDefaults : \(CriptoDefault.token)")
//            keychainValue = nil
//            print(keychainValue ?? "")
        }
    }
}

struct CriptoKit_Previews: PreviewProvider {
    static var previews: some View {
        CriptoKitExample()
    }
}
