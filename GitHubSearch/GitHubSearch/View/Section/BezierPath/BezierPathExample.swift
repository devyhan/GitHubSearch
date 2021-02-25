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
            BezierHGridView()
                .frame(height: 130)
            
            Text("VGrid")
                .font(.title)
                .frame(width: window.width, alignment: .leading)
                .padding(.leading, 30)
            BezierVGridView()
                .frame(height: window.height - 400)
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

