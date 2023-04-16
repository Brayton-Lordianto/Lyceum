// GPT3ViewModel.swift
// OpenAI chat-dalle
//
// Created by kz on 05/03/2023.
//

import Foundation
import ChatGPTSwift

class GPT3ViewModel: ObservableObject {

    let api = ChatGPTAPI(apiKey: apiKey2) // creating an instance of the ChatGPTAPI class and setting the API key 
    @Published var messages = [Message]() // initializing an empty array of Message objects as a Published property 

    // decode string into quiz 
    func decodeQuiz(_ text: String) -> Quiz {
        let jsonData = Data(text.utf8)
        var quiz = Quiz(questions: [])

        do {
            quiz = try JSONDecoder().decode(Quiz.self, from: jsonData)
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        return quiz
    }
    
    // curriculum quiz 
    func getCurriculumQuiz(on passage: String) async -> Quiz {
        let text = await getResponseSingle(prompt: curriculumPrompt(passage))
        return decodeQuiz(text)
    }
    
    // versus quiz
    func getVersusQuiz(on topic: String) async -> Quiz {
        let text = await getResponseSingle(prompt: versusPrompt(topic))
        return decodeQuiz(text)
    }

    // syllabus
    func getDetailedSyllabusAsString(on topic: String) async -> String {
        let text = await getResponseSingle(prompt: syllabusPrompt(topic))
        return text
    }
    
    // returning syllabus topics as an array of strings
//    func getSyllabusTopics(on topic: String) async -> String {
//        
//    }

    // getDetailedSyllabus(on topic: String) -> Syllabus // last priority
    // getDetailedSyllabusAsString(on topic: String) -> String // more generic
    // initializeChat(using prompt: String) -> String // more generic
    // send & receive based off of the textbox in a UI if we want to follow up on answers


    // single synchronous ask to receive
    private func getResponseSingle(prompt: String) async -> String {
        let header = "You will act as a machine that generates exactly what I ask you to generatea as long as it is appropriate. do not address me as a human, and do not do anything more than you are asked to."
        let trailer = ".\nDO NOT SEND ANYTHING ELSE INCLUDING ANY BACKTICKS AND ANY STARTING WORDS."
        let message = header + prompt + trailer
        do {
            print("asking \(message)")
            let result = try await api.sendMessage(text: message) // using the ChatGPTAPI object to send a message to the API and return a stream of messages
            return result
        } catch {
            print("error")
            
        }
        return "Error"
    }

    func getResponse(text: String) async{ // function to send user input to the API and update the view asynchronously
        
        self.addMessage(text, type: .text, isUserMessage: true) // adding user message to the view
        self.addMessage("", type: .text, isUserMessage: false) // showing an indicator for loading

        do {
            let stream = try await api.sendMessageStream(text: text) // using the ChatGPTAPI object to send a message to the API and return a stream of messages
            
            for try await line in stream { // looping through the stream and updating the view with each response
                DispatchQueue.main.async {
                    self.messages[self.messages.count - 1].content = self.messages[self.messages.count - 1].content as! String + line
                }
            }
        } catch {
            self.addMessage(error.localizedDescription, type: .error, isUserMessage: false) // if there's an error, show the error message
        }
    }
    
    private func addMessage(_ content: Any, type: MessageType, isUserMessage: Bool) { // function to add a new message to the array and update the view
        DispatchQueue.main.async {
            guard let lastMessage = self.messages.last else { // if there's no previous message, add the new message to the end of the array
                let message = Message(content: content, type: type, isUserMessage: isUserMessage)
                self.messages.append(message)
                return
            }
            let message = Message(content: content, type: type, isUserMessage: isUserMessage)
            if lastMessage.type == .indicator && !lastMessage.isUserMessage { // if the previous message was an indicator, replace it with the new message to remove the loading indicator
                self.messages[self.messages.count - 1] = message
            } else { // otherwise, add the new message to the end of the array
                self.messages.append(message)
            }
            
            if self.messages.count > 100 { // if there are more than 100 messages in the array, remove the oldest message
                self.messages.removeFirst()
            }
        }
    }
    
}
