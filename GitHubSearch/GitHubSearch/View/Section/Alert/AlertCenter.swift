//
//  AlertCenter.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/15.
//

import Foundation

class AlertCenter: ObservableObject {
    var isShowing: Bool = false {
        willSet {
            print("🛠", newValue)
            objectWillChange.send()
        }
    }
    
    var isMessaging: String = "default message" {
        willSet {
            print("🛠", newValue)
            objectWillChange.send()
        }
    }
}
