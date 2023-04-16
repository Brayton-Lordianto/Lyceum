//
//  GameManager+WebSocketManager.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/16/23.
//

import Foundation

extension GameManager {

    // handle websocket connections
    func connect() { // 2
        let url = URL(string: "ws://127.0.0.1:8080/connection")! // 3
        webSocketTask = URLSession.shared.webSocketTask(with: url) // 4
        webSocketTask?.receive(completionHandler: onReceive) // 5
        webSocketTask?.resume() // 6
    }

    func disconnect() { // 7
        webSocketTask?.cancel(with: .normalClosure, reason: nil) // 8
    }
    
    
    // sends the raw score to the server
    func send(score: Int) { 
        let message = URLSessionWebSocketTask.Message.string("\(score)") // 9
        webSocketTask?.send(message) { error in
            // none.
        }
    }

    // receives the raw score from the server, and calls on receive
    func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) { // 11
        webSocketTask?.receive(completionHandler: onReceive) // 12
        if case .success(let response) = incoming { // 2
            // decode the message from the server into a Int score
            if case .string(let text) = response {
                if let score = Int(text) {
                    print("got opponent score of \(score)")
                }
            }
            print("received: \(response)")
        }
        else if case .failure(let error) = incoming { // 3
            print("Error", error)
        }
    }

}
