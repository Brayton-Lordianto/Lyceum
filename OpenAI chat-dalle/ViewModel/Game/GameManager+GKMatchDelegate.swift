//
//  GameManager+GKMatchDelegate.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import Foundation
import GameKit

extension GameManager: GKMatchDelegate {
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        let message = String(data: data, encoding: .utf8)!
        print("Received message: \(message) from player: \(player.displayName)")
    }

    func sendString(_ string: String) {
        print(match)
        guard let match = match else { print("no match"); return }
        // let encoded = "strData:\(string)"
        let data = Data(string.utf8)
        do {
            try match.sendData(toAllPlayers: data, with: .reliable)
            print("Sent data: \(string)")
        } catch {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}
