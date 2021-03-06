//
//  TabNavigation.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/26.
//

import SwiftUI

struct TabNavigation: View {
  @State var isActionTab: Bool = false
  @State var isToggle: Bool = false
  //  @State var tab:
  @ObservedObject var tabController = TabController(actionIndex: 1)
  @Environment(\.presentationMode) var presentationMode
  
  let window = UIScreen.main.bounds

  var body: some View {
    
    TabView(selection: $tabController.index) {
      NavigationView {
        FirstView(isToggle: $isToggle)
          .navigationBarItems(leading: Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
          })
      }
      .tabItem {
        Image(systemName: "1.circle")
        Text("First")
      }
      .tag(0)
      
      NavigationView {
        Spacer()
          .navigationBarItems(leading: Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
          })
      }
      .tabItem {
        Image(systemName: "plus.circle")
        Text("center")
      }
      .tag(1)
      
      NavigationView {
        SecondView()
          .navigationBarItems(leading: Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
          })
      }
      .tabItem {
        Image(systemName: "2.circle")
        Text("Second")
      }
      .tag(2)
      
    }
    .navigationBarBackButtonHidden(false)
    .navigationBarTitle("SwiftUI", displayMode: .inline)
    .fullScreenCover(isPresented: $tabController.isActionTab, content: {
      PostContainer()
    })
    .frame(width: self.window.width, height: isToggle == true ? self.window.height + 160 : self.window.height)
    .edgesIgnoringSafeArea(.all)
    .border(Color.yellow, width: 1)
  }
}

struct TabNavigation_Previews: PreviewProvider {
  static var previews: some View {
    TabNavigation()
  }
}

struct PostContainer: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Button("Back", action: {
      presentationMode.wrappedValue.dismiss()
    })
  }
}

