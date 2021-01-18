//
//  ContentView.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/18.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink(
          destination: ButtonView(),
          label: {
            Text("Button")
          })
      }.navigationBarTitle("SwiftUI")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
