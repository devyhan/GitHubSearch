//
//  ButtonView.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/18.
//

import SwiftUI

struct ButtonView: View {
  var body: some View {
    List {
      NavigationLink(destination: DefaultButtonView(), label: {
        Text("Default")
      })
    }
    .navigationTitle("Button")
  }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView()
  }
}
