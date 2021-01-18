//
//  DefaultButton.swift
//  GitHubSearch
//
//  Created by 요한 on 2021/01/18.
//

import SwiftUI

private struct DefaultButtonStyle: ButtonStyle {
  let backgroundColor: Color
  let foregroundColor: Color
  let isDisabled: Bool
  
  func makeBody(configuration: Self.Configuration) -> some View {
    let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
    return configuration.label
      .padding()
      .foregroundColor(currentForegroundColor)
      .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
      .cornerRadius(25)
      .overlay(
        RoundedRectangle(cornerRadius: 25) // overlay cornerRadius property
          .stroke(currentForegroundColor, lineWidth: 1)
      )
      .padding([.top, .bottom], 10)
      .font(Font.system(size: 19, weight: .semibold))
  }
}

struct DefaultButton: View {
  private static let buttonHorizontalMargins: CGFloat = 20
  
  var backgroundColor: Color
  var foregroundColor: Color
  
  private let title: String
  private let action: () -> Void
  
  private let disabled: Bool
  
  init(title: String,
       disabled: Bool = false,
       backgroundColor: Color = Color.black,
       foregroundColor: Color = Color.white,
       action: @escaping () -> Void) {
    self.backgroundColor = backgroundColor
    self.foregroundColor = foregroundColor
    self.title = title
    self.action = action
    self.disabled = disabled
  }
  
  var body: some View {
    HStack {
      Spacer(minLength: DefaultButton.buttonHorizontalMargins)
      Button(action:self.action) {
        Text(self.title)
          .frame(maxWidth:.infinity)
      }
      .buttonStyle(DefaultButtonStyle(backgroundColor: backgroundColor,
                                    foregroundColor: foregroundColor,
                                    isDisabled: disabled))
      .disabled(self.disabled)
      Spacer(minLength: DefaultButton.buttonHorizontalMargins)
    }
    .frame(maxWidth:.infinity)
  }
}

// MARK: - ButtonView

struct DefaultButtonView: View {
  var body: some View {
    VStack {
      DefaultButton(title: "Button") {
        print("BUTTON")
      }
      DefaultButton(title: "Button", backgroundColor: Color.white, foregroundColor: Color.black) {
        print("BUTTON")
      }
    }
  }
}

// MARK: - Example

#if DEBUG
struct Example_Button01: View {
  var body: some View {
    DefaultButton(title: "ExampleButton01",
                backgroundColor: Color.white,
                foregroundColor: Color.black) {
      print("Hello World")
    }
  }
}

struct Example_Button02: View {
  var body: some View {
    DefaultButton(title: "ExampleButton02",
                backgroundColor: Color.black) {
      print("Hello World")
    }
  }
}
#endif

// MARK: - Preview

struct DefaultButton_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Example_Button01()
        .previewLayout(.fixed(width: 400, height: 100))
      Example_Button02()
        .previewLayout(.fixed(width: 400, height: 100))
    }
  }
}
