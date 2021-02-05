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
            value = CriptoDefault.token
        }
        .onDisappear {
            CriptoDefault.token = ""
            print("userDefaults : \(CriptoDefault.token)")
        }
    }
}

struct CriptoKit_Previews: PreviewProvider {
    static var previews: some View {
        CriptoKit()
    }
}
