//
//  BezierPathPractice02.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/03/01.
//

import SwiftUI

struct BezierPathPractice02: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 263, y: 516))
        path.addCurve(to: CGPoint(x: 213, y: 455), controlPoint1: CGPoint(x: 245, y: 479), controlPoint2: CGPoint(x: 229, y: 459))
        path.close()

        
        let someLayer = CAShapeLayer()
        someLayer.path = path.cgPath
        
        view.layer.addSublayer(someLayer)
        
        return view

    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct SomeBezierPathExample01: View {
    var body: some View {
        BezierPathPractice02()
    }
}


struct SomeBezierPathExample01_Previews: PreviewProvider {
    static var previews: some View {
        SomeBezierPathExample01()
            .previewDisplayName("BezierPath")
            .previewLayout(.fixed(width: 1100, height: 1100))
            .padding()
            .previewDisplayName("Custom size preview")
    }
}
