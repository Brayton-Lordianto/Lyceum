//
//  GameView.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameManager: GameManager
    var body: some View {
        VStack {
            Text("in Game")
            Button("send answer") {
                gameManager.answerQuestion()
            }
        }
    }
}
