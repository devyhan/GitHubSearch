//
//  UnderlineTextField.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/19.
//

import SwiftUI

struct UnderlineTextField: View {
  @Binding var text: String
  var placeholder: Text
  
  var body: some View {
    VStack(alignment: .leading) {
      if text.isEmpty || !text.isEmpty { placeholder }
      TextField("아이디를 입력하세요", text: $text)
        .autocapitalization(.none)
      HorizontalLine(color: Color(UIColor.placeholderText))
    }
  }
}

struct SecureUnderlineTextField: View {
  @Binding var text: String
  var placeholder: Text
  
  var body: some View {
    VStack(alignment: .leading) {
      if text.isEmpty || !text.isEmpty { placeholder }
      SecureField("비밀번호를 입력하세요", text: $text)
        .autocapitalization(.none)
      HorizontalLine(color: Color(UIColor.placeholderText))
    }
  }
}

// MARK: - Example
#if DEBUG
struct UnderlineTextField_Example: View {
  @ObservedObject private var userViewModel = UserViewModel()
  
  var body: some View {
    VStack {
      Spacer()
      
      Text("TextField")
        .fontWeight(.bold)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      
      Spacer()
      
      UnderlineTextField(text: $userViewModel.username, placeholder: Text("아이디"))
        .padding(.top, 32.0)
      
      Text(userViewModel.userIdMessage)
        .fontWeight(.bold)
        .foregroundColor(.red)
      
      SecureUnderlineTextField(text: $userViewModel.password, placeholder: Text("비밀번호"))
        .padding(.top, 32.0)
      
      Text(userViewModel.userPasswordMessage)
        .fontWeight(.bold)
        .foregroundColor(.red)
      
      Spacer()
    }.padding(.all, 20)
  }
}
#endif

// MARK: - Preview

//struct UnderlineTextField_Previews: PreviewProvider {
//  static var previews: some View {
//    UnderlineTextField_Example()
//  }
//


