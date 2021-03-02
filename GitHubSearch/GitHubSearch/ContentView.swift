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
    @EnvironmentObject private var alertCenter: AlertCenter
    
    var body: some View {
        NavigationView {
            List {
                Section(header: GroupHeader(title: "Example")) {
                    NavigationLink(
                        destination: ButtonView(),
                        label: {
                            Text("Button")
                        }
                    )
                    
                    NavigationLink(
                        destination: UnderlineTextField_Example(),
                        label: {
                            Text("TextField")
                        }
                    )
                    
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
                    
                    NavigationLink(
                        destination: CryptoKitExample(),
                        label: {
                            Text("CryptoKit")
                        }
                    )
                }.listStyle(GroupedListStyle())
                Section(header: GroupHeader(title: "feature")) {
                    NavigationLink(
                        destination: AlertExample(),
                        label: {
                            Text("Alert")
                        }
                    )
                    
                    NavigationLink(
                        destination: ButtonView(),
                        label: {
                            Text("Indicator")
                        }
                    )
                    
                    NavigationLink(
                        destination: BezierPathExample(),
                        label: {
                            Text("BezierPath")
                        }
                    )
                    
                    NavigationLink(
                        destination: MapView(),
                        label: {
                            Text("MapView")
                        }
                    )
                    
                }.listStyle(GroupedListStyle())
            }
            .navigationBarTitle("SwiftUI")
        }
        .alert(isPresented: $alertCenter.isShowing) {
            Alert(title: Text("Error"), message: Text("\(alertCenter.isMessaging)"), dismissButton: .default(Text("Dismiss")))
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
