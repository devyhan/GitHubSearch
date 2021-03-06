//
//  RegularExpression.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/29.
//

import Foundation

// MARK: - Define namespace

/**
# Usage
 ```
 AnyPublisher
   .map { someValue in
      Regex.email = someValue
      return Regex.$email
   }
   ...
 ```
 @propertywrapper `(SE-0258)`
 
 - get value
    - `Regex.email = someValue`
 - set value
    - `return Regex.$email`
 
*/

enum Regex {
  // 아이디
  @RegexWrapper(filter: RegularExpression.id)
  static var id: String
  
  // 이메일
  @RegexWrapper(filter: RegularExpression.email)
  static var email: String
  
  // 패스워드
  @RegexWrapper(filter: RegularExpression.password)
  static var pw: String
}

private enum RegularExpression {
  static let id = "[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\\s]"
  static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
  static let password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$#!%*?&]).{6,}$"
}

// MARK: - Propertywrapper

@propertyWrapper
struct RegexWrapper {
  let filter: String?
  var projectedValue: Bool = false
  private var text: String?
  
  init(filter: String) {
    self.filter = filter
  }
  
  var wrappedValue: String {
    get { text ?? "" }
    set { projectedValue = checkString(newText: newValue, filter: self.filter ?? "") }
  }
  
  private func checkString(newText: String, filter: String) -> Bool {
    switch filter {
    case RegularExpression.id:
      do {
        let regex = try NSRegularExpression(pattern: filter, options: [])
        let list = regex.matches(in: newText, options: [], range: NSRange.init(location: 0, length: newText.count))
        return list.count != newText.count ? false : true
      } catch {
        print("Define some error handling")
        return false
      }
    case RegularExpression.email, RegularExpression.password:
      let regex = NSPredicate(format: "SELF MATCHES %@", filter)
      return regex.evaluate(with: newText)
    default:
      print("Define some error handling")
      fatalError()
    }
  }
}
