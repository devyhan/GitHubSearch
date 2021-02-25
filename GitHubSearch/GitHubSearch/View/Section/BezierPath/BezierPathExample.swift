//
//  BezierPathExample.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/24.
//

import SwiftUI

struct BezierPathExample: View {
    
    private let window = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Text("BezierPathGrid")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 30)
            
            Text("HGrid")
                .font(.title)
                .frame(width: window.width, alignment: .leading)
                .padding(.leading, 30)
            HGridView()
                .frame(height: 130)
            
            Text("VGrid")
                .font(.title)
                .frame(width: window.width, alignment: .leading)
                .padding(.leading, 30)
            VGridView()
                .frame(height: window.height - 400)
        }
    }
}

struct HGridView: View {
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

struct VGridView: View {
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

// MARK: - Preview

struct BezierPathExample_Previews: PreviewProvider {
    static var previews: some View {
        BezierPathExample()
            .previewLayout(.fixed(width: 230, height: 230))
            .padding()
            .previewDisplayName("Custom size preview")
    }
}

