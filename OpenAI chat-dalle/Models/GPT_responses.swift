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

// usage:
/*
 let quiz = Quiz(...)
 quiz.questions[idx] is a QuizQuestion
 ForEach(Quiz.questions, id: \.self) { quizQuestion in
    Text(quizQuestion.A)
 ...
 }
 */
struct Quiz: Codable {
    var questions: [QuizQuestion]
}

struct Syllabus {

}
