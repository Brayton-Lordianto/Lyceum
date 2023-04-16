//
//  Variables.swift
//  Lyceum
//
//  Created by Long Hai on 4/15/23.
//

import Foundation

var chosenTopic = "Web Development"
var chosenSection = "HTML"

//--how many sections users can access for free
var avail = 2

var show = false

let apikey2 = "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"

var myQuiz = Quiz(questions: [
    QuizQuestion(question: "Which of the following is NOT a basic HTML tag?", A: "<html>", B: "<head>", C: "<body>", D: "<script>", answer: "D"),
    QuizQuestion(question: "b", A: "a", B: "b", C: "c", D: "d", answer: "A"),
    QuizQuestion(question: "c", A: "a", B: "b", C: "c", D: "d", answer: "B"),
    QuizQuestion(question: "d", A: "a", B: "b", C: "c", D: "d", answer: "C"),
])


var tokens = 1323
