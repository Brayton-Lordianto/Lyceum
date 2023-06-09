//
//  OpenAI_chat_dalleApp.swift
//  OpenAI chat-dalle
//
//  Created by kz on 07/02/2023.
//

import SwiftUI

@main
struct LyceumApp: App {
    let dalleViewModel = DalleViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dalleViewModel)
                .environmentObject(ViewControlModel())

        }
    }
}
