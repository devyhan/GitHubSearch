//
//  BezierVGridView.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/25.
//

import SwiftUI

struct BezierVGridView: View {
    let items = 1...20

    let columns = [
        GridItem(.fixed(130)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        BezierPathShape(lengthValue: 100, image: "coffee-\(item)")
                            .padding(.bottom, 110)
                            
                        Text("coffee\(item)")
                            .padding(.trailing, 30)
                            
                    }
                }
            }.padding(.leading, 30)
        }
    }
}

struct BezierVGridView_Previews: PreviewProvider {
    static var previews: some View {
        BezierVGridView()
    }
}
