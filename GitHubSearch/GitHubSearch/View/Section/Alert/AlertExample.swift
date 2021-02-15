//
//  AlertExample.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/15.
//

import SwiftUI

struct AlertExample: View {
    @State private var defaultAlert = false
    @State private var actionAlert = false
    
    @EnvironmentObject private var alertCenter: AlertCenter
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Default Alert")
            Button (action: {
                self.defaultAlert = true
            }) {
                Text("Show Alert")
            }
            .alert(isPresented: $defaultAlert) {
                Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
            }
            
            Spacer()
            
            Text("Action Alert")
            Button(action: {
                self.actionAlert = true
                alertCenter.isShowing = true
            }) {
                Text("Show Alert")
            }
            .alert(isPresented: $actionAlert) {
                Alert(title: Text("Title"), message: Text("Message"), primaryButton: .destructive(Text("Primary"), action: {
                    print("Action")
                }), secondaryButton: .cancel())
            }
            
            Spacer()
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                alertCenter.isShowing = true
                alertCenter.isMessaging = "test"
            }
        }
    }
}

struct AlertExample_Previews: PreviewProvider {
    static var previews: some View {
        AlertExample()
    }
}
