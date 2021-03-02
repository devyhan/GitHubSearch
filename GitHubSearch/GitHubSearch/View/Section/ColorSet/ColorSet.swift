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
            }
            .frame(width: window.width-60, height: window.height-400)
            .background(Semantic.backgroundGroupBase)
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
