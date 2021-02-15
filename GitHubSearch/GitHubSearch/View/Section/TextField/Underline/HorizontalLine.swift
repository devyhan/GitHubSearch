//
//  HorizontalLine.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/19.
//

import SwiftUI

struct HorizontalLineShape: Shape {
  func path(in rect: CGRect) -> Path {
    let fill = CGRect(x: .zero, y: .zero, width: rect.size.width, height: rect.size.height)
    var path = Path()
    path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))
    return path
  }
}

struct HorizontalLine: View {
  var color: Color
  
  var body: some View {
    HorizontalLineShape()
      .fill(color)
      .frame(minWidth: .zero, maxWidth: .infinity, minHeight: 1.0, maxHeight: 1.0)
  }
}

// MARK: - Preview

struct HorizontalLine_Previews: PreviewProvider {
    static var previews: some View {
      HorizontalLine(color: Color.black)
        .previewLayout(.fixed(width: 400, height: 50))
    }
}
