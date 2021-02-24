//
//  AlertCenter.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/15.
//

import Foundation

class AlertCenter: ObservableObject {
    
    // output
    @Published var isShowing: Bool = false
    @Published var isMessaging: String = "defalult message"
    
}

