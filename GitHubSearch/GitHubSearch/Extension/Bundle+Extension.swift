//
//  Bundle+Extension.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/02/08.
//

import Foundation

extension Bundle {
    // 앱 이름
    static var appName: String {
        if let value = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String { return value }
        return ""
    }
    
    // 앱 버전
    static var appVersion: String {
        if let value = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String { return value }
        return ""
    }
    
    // 앱 빌드 버전
    static var appBuildVersion: String {
        if let value = Bundle.main.infoDictionary?["CFBundleVersion"] as? String { return value }
        return ""
    }
    
    // 앱 번들 ID
    static var bundleIdentifier: String {
        if let value = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String { return value }
        return ""
    }
}
