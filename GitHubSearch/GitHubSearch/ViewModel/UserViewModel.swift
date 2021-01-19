//
//  User.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/19.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
  // input
  @Published var username = ""
  @Published var password = ""
  
  // output
  @Published var userIdMessage = ""
  @Published var userPasswordMessage = ""
  @Published var isValid = false
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  private var isUserIdValidPublisher: AnyPublisher<Bool, Never> {
    $username
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
        return true
      }
      .eraseToAnyPublisher()
  }
  
  init() {
    isUserIdValidPublisher
      .receive(on: RunLoop.main)
      .map { valid in
        valid ? "" : "양식이 올바르지 않습니다."
      }
      .assign(to: \.userIdMessage, on: self)
      .store(in: &cancellableSet)
  }
}
