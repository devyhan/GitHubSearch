//
//  Test_01.swift
//  GitHubSearch
//
//  Created by 조요한 on 2021/01/28.
//

import SwiftUI

import Combine
import SwiftUI

class FrequentUpdater: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.01,
            repeats: true
        ) { _ in
            self.objectWillChange.send()
        }
    }
}

struct Test_01: View {
    @ObservedObject var updater = FrequentUpdater()
    @State private var tapCount = 0

    var body: some View {
        VStack {
            Text("\(UUID().uuidString)")

            Button(action: {
                self.tapCount += 1
            }) {
                Text("Tap count: \(tapCount)")
            }
        }
    }
}

struct Test_01_Previews: PreviewProvider {
    static var previews: some View {
        Test_01()
    }
}
