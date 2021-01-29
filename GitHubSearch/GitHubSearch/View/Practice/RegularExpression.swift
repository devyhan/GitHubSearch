//
//  RegularExpression.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/29.
//

import Foundation

// MARK: - Define namespace

enum Regex {
  // 아이디
  @RegexWrapper(filter: "[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\\s]")
  static var userId: String
}

// MARK: - Valid

private struct RegexValid {
  static func checkString(newText: String, filter: String) -> Bool {
    do {
      let regex = try NSRegularExpression(pattern: filter, options: [])
      let list = regex.matches(in: newText, options: [], range: NSRange.init(location: 0, length: newText.count))
      return list.count != newText.count ? false : true
    } catch let error {
      print("Define some error handling")
      return false
    }
  }
}

// MARK: - Propertywrapper

@propertyWrapper
struct RegexWrapper {
  let filter: String?
  var projectedValue: Bool
  private var text: String
  
  init(filter: String) {
    self.text = ""
    self.filter = filter
    self.projectedValue = false
  }
  
  var wrappedValue: String {
    get { text }
    set { projectedValue = RegexValid.checkString(newText: newValue, filter: self.filter ?? "") }
  }
}
