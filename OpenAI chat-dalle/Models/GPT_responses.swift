//
//  GPT_responses.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import Foundation

struct QuizQuestion: Codable {
    var question: String
    var A: String
    var B: String
    var C: String
    var D: String
    var answer: String
    var explanation: String? // made optional because versus does not use this.
}

struct Quiz: Codable {
    var questions: [QuizQuestion]
}

struct Syllabus {

}