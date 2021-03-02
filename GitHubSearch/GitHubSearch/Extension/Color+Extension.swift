//
//  Color+Extension.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/03/02.
//

import SwiftUI

// MARK: - Basic Color Set
/// 베이직 컬러는 컬러 팔레트의 개념으로 명도 혹은 기능과 서비스에 따라 정의
enum Basic {
    static let black01: Color = Color(named: "black-1")
    static let black02: Color = Color(named: "black-2")
    static let black03: Color = Color(named: "black-3")
    static let black04: Color = Color(named: "black-4")
    static let black05: Color = Color(named: "black-5")
    static let black06: Color = Color(named: "black-6")
}

// MARK: - Semantic Color Set
/// 시멘틱 컬러는 컬러 팔레트의 개념인 베이직 컬러를 가져와서 사용
/// 사용되는 목적과 UI에 따라 네이밍하고 적용하는 컬러
enum Semantic {
    static let backgroundBase: Color = Color(light: .white, dark: Basic.black01)
    static let backgroundElevator: Color = Color(light: .white, dark: Basic.black02)
    static let backgroundGroupBase: Color = Color(light: .white, dark: Basic.black03)
}

extension Color {

    /**
     지정된 색상을 사용하여 동적으로 색상 데이터를 생성하는 색상 체게를 만든다
     
     parameter
     - lhs: Light mode의 색상
     - rhs: Dark mode의 색상
     */
    init(light: Color, dark: Color) {
        self.init(UIColor.init { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
    }
    
    /**
     지정된 사용자 정의색상을 사용하여 동적으로 색상 데이터를 생성하는 색상 체게를 만든다, 색상이 없을경우 .clear 색상을 반환
     
     parameter
     - named: 사용자 지정 색상의 String value
     */
    init(named name: String) {
        self.init(UIColor.init(named: name) ?? UIColor.init(.clear))
    }
}


