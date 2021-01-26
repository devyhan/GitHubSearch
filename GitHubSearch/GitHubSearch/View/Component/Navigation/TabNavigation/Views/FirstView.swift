//
//  FirstView.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/26.
//

import SwiftUI

struct FirstView: View {
  @State var count: Int = 0
  var body: some View {
    VStack {
      NavigationLink("Go to Second", destination: SecondView())
      
      Spacer()
      
      Button("Plus", action: {
          count = count + 1
      })
      Text("\(count)")
      
      Spacer()
    }
//    .navigationBarBackButtonHidden(true)
  }
}

struct FirstView_Previews: PreviewProvider {
  static var previews: some View {
    FirstView()
  }
}
