//
//  GameManager+GKMatchmakerDelegate.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import Foundation
import GameKit

extension GameManager: GKMatchmakerViewControllerDelegate {
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true)
        print("found match")
        startGame(newMatch: match)
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true, completion: nil)
        print("match maked?")
    }
    
}
