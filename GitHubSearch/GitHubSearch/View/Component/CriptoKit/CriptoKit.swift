//
//  CriptoKit.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/05.
//

import SwiftUI
import CryptoKit

struct CriptoKit: View {
    @State var value: String = ""
    @State var hasingValue: String = ""
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Hashed value")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("\(hasingValue)")
                .padding()
                .border(Color.black, width: 1)
                .padding()
        }
        .onAppear {
            UserDefault.token = "access token"
            value = UserDefault.token
            let hasingData = Data(UserDefault.token.utf8)
            let hashed = SHA512.hash(data: hasingData)
            print("userDefaults : \(UserDefault.token)")
            print("hashing data : \(hashed.description)")
            print("get String :", hashed.compactMap { String(format: "%02x", $0) }.joined())
            hasingValue = hashed.description
        }
        .onDisappear {
            
            UserDefault.token = ""
            print("userDefaults : \(UserDefault.token)")
        }
    }
}

struct CriptoKit_Previews: PreviewProvider {
    static var previews: some View {
        CriptoKit()
    }
}
