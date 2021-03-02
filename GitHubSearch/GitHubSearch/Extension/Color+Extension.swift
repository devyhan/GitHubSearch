//
//  Color+Extension.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/03/02.
//

import SwiftUI

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


