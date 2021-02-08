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
      ContentView()
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

// MARK: - Semantic Color Set
/// 시멘틱 컬러는 컬러 팔레트의 개념인 베이직 컬러를 가져와서 사용
/// 사용되는 목적과 UI에 따라 네이밍하고 적용하는 컬러
enum Semantic {
  static let backgroundBase: Color = Color(UIColor(light: .white, dark: .black005))
  static let backgroundElevator: Color = Color(UIColor(light: .white, dark: .black010))
  static let backgroundGroupBase: Color = Color(UIColor(light: .white, dark: .black015))
}


extension UIColor {
  
  // MARK: - Basic Color Set
  /// 베이직 컬러는 컬러 팔레트의 개념으로 명도 혹은 기능과 서비스에 따라 정의
  static var black005: UIColor {
    return UIColor(named: "Black01")!
  }
  static var black010: UIColor {
    return UIColor(named: "Black02")!
  }
  static var black015: UIColor {
    return UIColor(named: "Black03")!
  }
  
  /**
   지정된 색상을 사용하여 동적으로 색상 데이터를 생성하는 색상 개게를 만든다
   
   13.0이전의 SDK의경우 `Light`버전으로 생산
   
   available
      - iOS: 13.0
      - tvOS: 13.0
   
   parameter
      - lhs: Light mode의 색상
      - rhs: Dark mode의 색상
   */
  convenience init(light: UIColor, dark: UIColor) {
    if #available(iOS 13.0, tvOS 13.0, *) {
      self.init { traitCollection in
        traitCollection.userInterfaceStyle == .dark ? dark : light
      }
    }
    else {
      self.init(cgColor: light.cgColor)
    }
  }
}


