//
//  TabController.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/26.
//

import Combine

final class TabController: ObservableObject {
  @Published var isActionTab: Bool = false
  var actionIndex: Int?
  var index: Int = 0 {
    didSet {
      if index == actionIndex {
        index = oldValue
        isActionTab = true
      }
      objectWillChange.send()
    }
  }
  
  init(actionIndex: Int? = nil) {
      self.actionIndex = actionIndex
  }
}

