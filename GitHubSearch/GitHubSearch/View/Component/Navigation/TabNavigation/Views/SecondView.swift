//
//  SecondView.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/26.
//

import SwiftUI

struct SecondView: View {
  @State var count: Int = 0
  var body: some View {
    VStack {
      NavigationLink("Go to First", destination: FirstView())
      
      Spacer()
      
      Button("Plus", action: {
          count = count + 1
      })
      Text("\(count)")
      
      Spacer()
    }
  }
}

struct SecondView_Previews: PreviewProvider {
  static var previews: some View {
    SecondView()
  }
}
