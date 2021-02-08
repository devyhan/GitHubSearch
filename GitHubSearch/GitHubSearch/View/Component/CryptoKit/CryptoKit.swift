//
//  CriptoKit.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import SwiftUI
import CryptoKit


struct CriptoKitExample: View {
    @State var tokenValue: String = ""
    @State var UserDefaultValue: String = ""
    @State var keyChainValue: String = ""
    @KeychainWrapper(account: Bundle.bundleIdentifier)
    var keyChain: String?
    
    var body: some View {
        VStack {
            Text("CryptoDefault")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Access token sample")
            Text("\(tokenValue)")
                .padding()

            Spacer()
            
            Text("Set userdefault value")
            Text("\(UserDefaultValue)")
                .padding()
            
            Spacer()
            
            Text("Saved keychain value")
            Text("\(keyChainValue)")
                .padding()
            
        }
        .onAppear {
            CryptoDefault.token = "IAMUNENCRYPTEDACCESSTOKENVALUE"
            tokenValue = CryptoDefault.token
            UserDefaultValue = "\(UserDefaults.standard.object(forKey: "x-access-token")!)"
            keyChainValue = "\(keyChain!)"
            
            // refresh token test
            CryptoDefault.refreshToken = "IAMUNENCRYPTEDREFRESHTOKENVALUE"
            print("✅ Refresh token testing ..")
            print("Set userdefault value :", UserDefaults.standard.object(forKey: "x-refresh-token")!)
            print("Refreshtoken :", CryptoDefault.refreshToken)
        }
        .onDisappear {
            CryptoDefault.token = ""
            print("userDefaults : \(CryptoDefault.token)")
        }
    }
}

struct CriptoKit_Previews: PreviewProvider {
    static var previews: some View {
        CriptoKitExample()
    }
}
