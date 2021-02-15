//
//  User.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/19.
//

import Foundation
import Combine
import SwiftUI

class UserViewModel: ObservableObject {
  // input
  @Published var username = ""
  @Published var useremail = ""
  @Published var password = ""
  
  // output
  @Published var userIdMessage = ""
  @Published var userEmailMessage = ""
  @Published var userPasswordMessage = ""
  @Published var isValid = false
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  private var isUserIdValidPublisher: AnyPublisher<Bool, Never> {
    $username
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
        Regex.id = input
        return Regex.$id
      }
      .eraseToAnyPublisher()
  }
  
  private var isUserEmailValidPUblisher: AnyPublisher<Bool, Never> {
    $useremail
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
        Regex.email = input
        return Regex.$email
      }
      .eraseToAnyPublisher()
  }
  
  private var isUserPasswordValidPUblisher: AnyPublisher<Bool, Never> {
    $password
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
        Regex.pw = input
        return Regex.$pw
      }
      .eraseToAnyPublisher()
  }
  
  private var isTextFieldValidPublisher: AnyPublisher<Bool, Never> {
    Publishers.CombineLatest3(isUserIdValidPublisher, isUserEmailValidPUblisher, isUserPasswordValidPUblisher)
      .map { id, email, pw in
        id && email && pw
      }
      .eraseToAnyPublisher()
  }
  
  init() {
    isUserIdValidPublisher
      .receive(on: RunLoop.main)
      .map { result in
        result ? "" : "아이디 양식이 올바르지 않습니다."
      }
      .assign(to: \.userIdMessage, on: self)
      .store(in: &cancellableSet)
    
    isUserEmailValidPUblisher
      .receive(on: RunLoop.main)
      .map { result in
        print(result)
        return result ? "" : "이메일 양식이 올바르지 않습니다."
      }
      .assign(to: \.userEmailMessage, on: self)
      .store(in: &cancellableSet)
    
    isUserPasswordValidPUblisher
      .receive(on: RunLoop.main)
      .map { result in
        print(result)
        return result ? "" : "패스워드는 대문자, 특수문자를 포함하여 최소 6글자 이상이여야 합니다."
      }
      .assign(to: \.userPasswordMessage, on: self)
      .store(in: &cancellableSet)
    
    isTextFieldValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValid, on: self)
      .store(in: &cancellableSet)
  }
}
