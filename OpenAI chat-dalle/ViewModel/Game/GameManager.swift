//  GameManager.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import Foundation
import GameKit

enum PlayerAuthState {
    case authenticating
    case authenticated
    case restricted
}

class GameManager: NSObject, ObservableObject {    

    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authState = PlayerAuthState.authenticating

    @Published var score = 0

    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local
    var playerUUID = UUID().uuidString

    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }

    func authenticateUser() {
        // was a little diff. 
        GKLocalPlayer.local.authenticateHandler = { [self] viewController, error in
            if let viewController {
                self.rootViewController?.present(viewController, animated: true, completion: nil)
            } else if self.localPlayer.isAuthenticated {
                print("User is authenticated")
            } else {
                print("User is not authenticated")
            }

            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted {
                    self.authState = .restricted
                } else {
                    self.authState = .authenticated
                }
            }
        }
    }

    func startMatching() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        request.inviteMessage = "Hey, let's play a game!"

        let mmvc = GKMatchmakerViewController(matchRequest: request)
        // mmvc.showExistingMatches = false
        mmvc?.matchmakerDelegate = self
        // mmvc.turnBasedMatchmakerDelegate = self
        rootViewController?.present(mmvc!, animated: true, completion: nil)
    }

    func startGame(newMatch: GKMatch) {
        inGame = true
        isGameOver = false
        match = newMatch
        otherPlayer = match?.players.first
        sendString("hi there")
        print("Starting game")
    }
    
    func answerQuestion() {
        sendString("Answered")
    }
}
