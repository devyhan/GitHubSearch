//
//  SomeBezierPathExample.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/25.
//

import SwiftUI

struct DrawView: UIViewRepresentable {
    
    let image: String
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let bubblePath = UIBezierPath()
        bubblePath.move(to: CGPoint(x: 7.5, y: 7.6))
        bubblePath.addCurve(to: CGPoint(x: 4, y: 33), controlPoint1: CGPoint(x: 4, y: 12.4), controlPoint2: CGPoint(x: 4, y: 19.3))
        bubblePath.addCurve(to: CGPoint(x: 7.5, y: 58.4), controlPoint1: CGPoint(x: 4, y: 46.7), controlPoint2: CGPoint(x: 4, y: 53.6))
        bubblePath.addCurve(to: CGPoint(x: 11.6, y: 62.5), controlPoint1: CGPoint(x: 8.6, y: 60), controlPoint2: CGPoint(x: 10, y: 61.4))
        bubblePath.addCurve(to: CGPoint(x: 35, y: 66), controlPoint1: CGPoint(x: 16.1, y: 65.8), controlPoint2: CGPoint(x: 22.6, y: 66))
        bubblePath.addLine(to: CGPoint(x: 35, y: 71.1))
        bubblePath.addCurve(to: CGPoint(x: 36.6, y: 71.7), controlPoint1: CGPoint(x: 35, y: 71.9), controlPoint2: CGPoint(x: 36, y: 72.3))
        bubblePath.addLine(to: CGPoint(x: 42.3, y: 66))
        bubblePath.addCurve(to: CGPoint(x: 62.4, y: 62.5), controlPoint1: CGPoint(x: 52.6, y: 65.9), controlPoint2: CGPoint(x: 58.3, y: 65.5))
        bubblePath.addCurve(to: CGPoint(x: 66.5, y: 58.4), controlPoint1: CGPoint(x: 64, y: 61.4), controlPoint2: CGPoint(x: 65.4, y: 60))
        bubblePath.addCurve(to: CGPoint(x: 70, y: 33), controlPoint1: CGPoint(x: 70, y: 53.6), controlPoint2: CGPoint(x: 70, y: 46.7))
        bubblePath.addCurve(to: CGPoint(x: 66.5, y: 7.6), controlPoint1: CGPoint(x: 70, y: 19.3), controlPoint2: CGPoint(x: 70, y: 12.4))
        bubblePath.addCurve(to: CGPoint(x: 62.4, y: 3.5), controlPoint1: CGPoint(x: 65.4, y: 6), controlPoint2: CGPoint(x: 64, y: 4.6))
        bubblePath.addCurve(to: CGPoint(x: 37, y: 0), controlPoint1: CGPoint(x: 57.6, y: 0), controlPoint2: CGPoint(x: 50.7, y: 0))
        bubblePath.addCurve(to: CGPoint(x: 11.6, y: 3.5), controlPoint1: CGPoint(x: 23.3, y: 0), controlPoint2: CGPoint(x: 16.4, y: 0))
        bubblePath.addCurve(to: CGPoint(x: 7.5, y: 7.6), controlPoint1: CGPoint(x: 10, y: 4.6), controlPoint2: CGPoint(x: 8.6, y: 6))
        bubblePath.close()


        let bubbleLayer = CAShapeLayer()
        bubbleLayer.path = bubblePath.cgPath
        view.layer.addSublayer(bubbleLayer)
        
        let imagePath = UIBezierPath()
        imagePath.move(to: CGPoint(x: 5, y: 33))
        imagePath.addCurve(to: CGPoint(x: 8.4, y: 8.3), controlPoint1: CGPoint(x: 5, y: 19.7), controlPoint2: CGPoint(x: 5, y: 13))
        imagePath.addCurve(to: CGPoint(x: 12.3, y: 4.4), controlPoint1: CGPoint(x: 9.5, y: 6.8), controlPoint2: CGPoint(x: 10.8, y: 5.5))
        imagePath.addCurve(to: CGPoint(x: 37, y: 1), controlPoint1: CGPoint(x: 17, y: 1), controlPoint2: CGPoint(x: 23.7, y: 1))
        imagePath.addCurve(to: CGPoint(x: 61.7, y: 4.4), controlPoint1: CGPoint(x: 50.3, y: 1), controlPoint2: CGPoint(x: 57, y: 1))
        imagePath.addCurve(to: CGPoint(x: 65.6, y: 8.3), controlPoint1: CGPoint(x: 63.2, y: 5.5), controlPoint2: CGPoint(x: 64.5, y: 6.8))
        imagePath.addCurve(to: CGPoint(x: 69, y: 33), controlPoint1: CGPoint(x: 69, y: 13), controlPoint2: CGPoint(x: 69, y: 19.7))
        imagePath.addCurve(to: CGPoint(x: 65.6, y: 57.7), controlPoint1: CGPoint(x: 69, y: 46.3), controlPoint2: CGPoint(x: 69, y: 53))
        imagePath.addCurve(to: CGPoint(x: 61.7, y: 61.6), controlPoint1: CGPoint(x: 64.5, y: 59.2), controlPoint2: CGPoint(x: 63.2, y: 60.5))
        imagePath.addCurve(to: CGPoint(x: 37, y: 65), controlPoint1: CGPoint(x: 57, y: 65), controlPoint2: CGPoint(x: 50.3, y: 65))
        imagePath.addCurve(to: CGPoint(x: 12.3, y: 61.6), controlPoint1: CGPoint(x: 23.7, y: 65), controlPoint2: CGPoint(x: 17, y: 65))
        imagePath.addCurve(to: CGPoint(x: 8.4, y: 57.7), controlPoint1: CGPoint(x: 10.8, y: 60.5), controlPoint2: CGPoint(x: 9.5, y: 59.2))
        imagePath.addCurve(to: CGPoint(x: 5, y: 33), controlPoint1: CGPoint(x: 5, y: 53), controlPoint2: CGPoint(x: 5, y: 46.3))
        imagePath.close()
        
        let imageLayer = CAShapeLayer()
        imageLayer.path = imagePath.cgPath
        
        let imageMaskLayer = CALayer()
        
        imageMaskLayer.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        imageMaskLayer.contents = UIImage(named: image)?.cgImage
        imageMaskLayer.mask = imageLayer
        view.layer.addSublayer(imageMaskLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}

struct SomeBezierPathExample: View {
    var body: some View {
        DrawView(image: "cafe-5")
    }
}

struct SomeBezierPathExample_Previews: PreviewProvider {
    static var previews: some View {
        SomeBezierPathExample()
            .previewDisplayName("BezierPath")
            .previewLayout(.fixed(width: 110, height: 110))
            .padding()
            .previewDisplayName("Custom size preview")
    }
}
