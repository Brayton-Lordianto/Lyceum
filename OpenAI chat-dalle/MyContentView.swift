//
//  MyContentView.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import SwiftUI

struct MyContentView: View {
    @StateObject var gameManager = GameManager()
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()

            if gameManager.isGameOver {
                Text("Game Over")
            } else if gameManager.inGame {
                Text("In Game")
            } else {
                Text("Not in Game")
            }
        
            Button("Authenticate") {
                gameManager.authenticateUser()
            }
            
            Button("Start Game") {
                gameManager.startMatching()
            }
        }
    }
}

struct MyContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyContentView()
    }
}
