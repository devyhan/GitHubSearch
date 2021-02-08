//
//  ContentView.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/18.
//

import SwiftUI

struct GroupHeader: View {
    var backgroundColor: Color
    var forgroundColor: Color
    
    let title: String
    
    init(title: String,
         backgroundColor: Color = Semantic.backgroundBase,
         forgroundColor: Color = Color.primary) {
        self.backgroundColor = backgroundColor
        self.forgroundColor = forgroundColor
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(self.title)
                .font(.headline)
                .foregroundColor(self.forgroundColor)
                .padding()
            
            Spacer()
        }
        .background(self.backgroundColor)
        .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0)
        )
    }
}

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: GroupHeader(title: "Component")) {
                    NavigationLink(
                        destination: ButtonView(),
                        label: {
                            Text("Button")
                        })
                    NavigationLink(
                        destination: UnderlineTextField_Example(),
                        label: {
                            Text("TextField")
                        })
                    NavigationLink(
                        destination: ButtonView(),
                        label: {
                            Text("Indicator")
                        })
                    
                    NavigationLink(
                        destination: ButtonView(),
                        label: {
                            Text("Login")
                        })
                    
                    HStack {
                        Button("Navigation") {
                            isPresented.toggle()
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            TabNavigation()
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14))
                            .opacity(0.3)
                    }
                }.listStyle(GroupedListStyle())
                Section(header: GroupHeader(title: "feature")) {
                    NavigationLink(
                        destination: CriptoKitExample(),
                        label: {
                            Text("CriptoKit")
                        }
                    )
                    
                }.listStyle(GroupedListStyle())
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

class Setting: ObservableObject {
    @Published var toggle = false
}


// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12 mini")
            
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
                .previewDisplayName("iPhone SE (2nd generation)")
                .colorScheme(.dark)
        }
    }
}
