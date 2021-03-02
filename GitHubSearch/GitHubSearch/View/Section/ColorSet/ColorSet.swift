//
//  ColorSet.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/03/02.
//

import SwiftUI

struct ColorSet: View {
    let window = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Text("backgroundBase")
            VStack {
                Text("backgroundGroupBase")
                
                VStack {
                    Text("BasicColor_black01")
                        .foregroundColor(Basic.black01)
                    Text("BasicColor_black02")
                        .foregroundColor(Basic.black02)
                    Text("BasicColor_black03")
                        .foregroundColor(Basic.black03)
                    Text("BasicColor_black04")
                        .foregroundColor(Basic.black04)
                    Text("BasicColor_black05")
                        .foregroundColor(Basic.black05)
                    Text("BasicColor_black06")
                        .foregroundColor(Basic.black06)
                }
                .frame(width: window.width-90, height: window.height-600)
                .background(Semantic.backgroundGroupBase)
            }
            .frame(width: window.width-60, height: window.height-400)
            .background(Semantic.backgroundElevator)
        }
        .frame(width: window.width-30, height: window.height-200)
        .background(Semantic.backgroundBase)
    }
}

struct ColorSet_Previews: PreviewProvider {
    static var previews: some View {
        ColorSet()
            .colorScheme(.dark)
            .previewDisplayName("ColorSet")
    }
}
