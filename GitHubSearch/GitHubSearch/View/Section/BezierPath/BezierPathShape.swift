//
//  BezierPathShape.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/24.
//

import SwiftUI

struct BezierPathShape: UIViewRepresentable {
    
    private let rootLayer = CALayer()
    
    let lengthValue: CGFloat
    let image: String
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: lengthValue, height: lengthValue))
        let bounds = view.bounds
        
        let path = UIBezierPath()
        let startPt = CGPoint(x: lengthValue / 2, y: 0)
        path.move(to: startPt)
        
        let right_destPt = CGPoint(x: lengthValue, y: lengthValue / 2)
        let right_control1Pt = CGPoint(x: lengthValue - lengthValue / 10, y: 0)
        let right_control2Pt = CGPoint(x: lengthValue, y: lengthValue / 10)
        path.addCurve(to: right_destPt, controlPoint1: right_control1Pt, controlPoint2: right_control2Pt)
        
        let bottom_destPt = CGPoint(x: lengthValue / 2, y: lengthValue)
        let bottom_control1Pt = CGPoint(x: lengthValue, y: lengthValue - lengthValue / 10)
        let bottom_control2Pt = CGPoint(x: lengthValue - lengthValue / 10, y: lengthValue)
        path.addCurve(to: bottom_destPt, controlPoint1: bottom_control1Pt, controlPoint2: bottom_control2Pt)
        
        let left_destPt = CGPoint(x: 0, y: lengthValue / 2)
        let left_control1Pt = CGPoint(x: lengthValue / 10, y: lengthValue)
        let left_control2Pt = CGPoint(x: 0, y: lengthValue - lengthValue / 10)
        path.addCurve(to: left_destPt, controlPoint1: left_control1Pt, controlPoint2: left_control2Pt)
        
        let top_destPt = startPt
        let top_control1Pt = CGPoint(x: 0, y: lengthValue / 10)
        let top_control2Pt = CGPoint(x: lengthValue / 10, y: 0)
        path.addCurve(to: top_destPt, controlPoint1: top_control1Pt, controlPoint2: top_control2Pt)

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        rootLayer.frame = bounds
        rootLayer.contents = UIImage(named: image)?.cgImage
        rootLayer.mask = maskLayer
        
        view.layer.addSublayer(rootLayer)
        
        return view
        
    }
    
    func updateUIView(_ uiViwe: UIView, context: Context) {
        
    }

}

// MARK: - Preview

struct BezierPathShape_Previews: PreviewProvider {
    static var previews: some View {
        BezierPathShape(lengthValue: 130, image: "cafe-1")
            .previewLayout(.fixed(width: 160, height: 160))
            .padding()
            .previewDisplayName("Custom size preview")
    }
}
