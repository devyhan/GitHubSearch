//
//  Example_01.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/28.
//

import SwiftUI

struct Example_01: View {
  
  var body: some View {
//    BorderVstackView()
    Label("Heart Rate", systemImage: "heart.fill")
  }
}

struct Example_01_Previews: PreviewProvider {
  static var previews: some View {
    Example_01()
  }
}


// MARK: - View
//
//struct  {
//  var body: some View {
//    Label {
//      Text("Hello")
//    } icon : {
//      Image(systemName: "heart")
//    }
//  }
//}

struct BorderVstackView<Content: View>: View {
  let content: () -> Content
  
  init(@ViewBuilder content: @escaping () ->  Content) {
    self.content = content
  }
  
  var body: some View {
    VStack {
      content()
    }.border(Color.black, width: 3.0)
  }
}



