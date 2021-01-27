//
//  FirstView.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/26.
//

import SwiftUI

struct FirstView: View {
  @State var count: Int = 0
  @Binding var isToggle: Bool
  
  var body: some View {
    VStack {
      NavigationLink("Go to Second", destination: SecondView())
      
      Spacer()
      
      Text("\(count)")
        .font(.system(size: 100, weight: .bold))
      
      VStack {
        HStack {
          Button("Plus", action: {
            count = count + 1
          })
          Button("Minus", action: {
            count = count - 1
          })
        }
        
        Button("Minus", action: {
          isToggle.toggle()
        })
      }
      
      Spacer()
    }
    .border(Color.black, width: 1)
  }
}
//
//struct FirstView_Previews: PreviewProvider {
//  static var previews: some View {
//    FirstView()
//  }
//}
