//
//  BezierPathExample.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/24.
//

import SwiftUI

struct BezierPathExample: View {
    var body: some View {
        VStack {
            HStack {
                BezierPathShape(lengthValue: 130, image: "cafe-1")
                BezierPathShape(lengthValue: 130, image: "cafe-2")
                BezierPathShape(lengthValue: 130, image: "cafe-3")
            }
            
            HStack {
                BezierPathShape(lengthValue: 130, image: "cafe-4")
                BezierPathShape(lengthValue: 130, image: "cafe-5")
                BezierPathShape(lengthValue: 130, image: "cafe-6")
            }
            
            HStack {
                BezierPathShape(lengthValue: 130, image: "cafe-7")
                BezierPathShape(lengthValue: 130, image: "cafe-8")
                BezierPathShape(lengthValue: 130, image: "cafe-9")
            }
            
            HStack {
                BezierPathShape(lengthValue: 130, image: "cafe-10")
                BezierPathShape(lengthValue: 130, image: "cafe-11")
                BezierPathShape(lengthValue: 130, image: "cafe-12")
            }
            
            HStack {
                BezierPathShape(lengthValue: 130, image: "cafe-13")
                BezierPathShape(lengthValue: 130, image: "cafe-14")
                BezierPathShape(lengthValue: 130, image: "cafe-15")
            }
        
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

