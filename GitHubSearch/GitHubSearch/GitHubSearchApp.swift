//
//  GitHubSearchApp.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/18.
//

import os
import SwiftUI
import CoreLocation
import CryptoKit

@main
struct GitHubSearchApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let osLog = OSLog(subsystem: "user locale info", category: "GitHubSearch")
    
    init() {
        let locale = Locale.current
        
        switch locale.regionCode ?? "empty" {
        case "EN":
            os_log("User Locate %@", log: self.osLog, type: .info, "\"EN\"")
        case "KR":
            os_log("User Locate %@", log: self.osLog, type: .info, "\"KR\"")
        default:
            os_log("User Locate %@", log: self.osLog, type: .info, "\"Noting user locate info\"")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AlertCenter())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager!
    private var latitude, longitude: Double?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}
