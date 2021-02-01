//
//  DarkMode.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/01.
//

import SwiftUI

struct DarkMode: View {
  let window = UIScreen.main.bounds
  
  var body: some View {
    VStack {
      Text("#Some Title")
        .frame(width: window.width - 20, alignment: .leading)
        .font(.largeTitle)
        .padding()
        .background(Semantic.backgroundBase)
      
      VStack {
        Text("Some View")
          .frame(width: window.width - 20, height: 250)
          .background(Semantic.backgroundGroupBase)
          
        
        HStack {
          Image(systemName: "heart.fill")
            .foregroundColor(.red)
          Text("Some Text")
          
          Spacer()
          
          Text("21.02.01")
        }
        .frame(width: window.width - 20)
        .padding()
      }
      .frame(width: window.width - 20, height: 300)
      .padding()
      .background(Semantic.backgroundElevator)
      .border(Color.black, width: 1)

    }
    .frame(width: window.width, height: window.height)
    .padding()
    .background(Semantic.backgroundBase)
  }
}

// MARK: - Preview

struct DarkMode_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DarkMode()
        .previewDevice("iPhone 12 mini")
        .previewDisplayName("iPhone 12 mini")
        .colorScheme(.dark)

      DarkMode()
        .previewDevice("iPhone 12 mini")
        .previewDisplayName("iPhone 12 mini")
        .colorScheme(.light)
    }
  }
}
