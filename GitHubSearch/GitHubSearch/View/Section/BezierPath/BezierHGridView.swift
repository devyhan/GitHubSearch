//
//  BezierHGridView.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/25.
//

import SwiftUI

struct BezierHGridView: View {
    let items = 1...18

    let rows = [
        GridItem(.fixed(130)),
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        BezierPathShape(lengthValue: 100, image: "cafe-\(item)")
                            .padding(.trailing, 110)
                        Text("cafe\(item)")
                    }
                }
            }.padding(.leading, 30)
        }
    }
}

struct BezierHGridView_Previews: PreviewProvider {
    static var previews: some View {
        BezierHGridView()
    }
}
