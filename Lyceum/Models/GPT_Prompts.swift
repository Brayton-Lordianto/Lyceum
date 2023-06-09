//
//  GPT_Prompts.swift
//
//  Created by Brayton Lordianto on 4/15/23.
//

import Foundation

extension GPT3ViewModel {
    func curriculumPrompt(_ message: String) -> String {
        return """
            write a quiz with 10 questions in the following json format. Each question must have four choices and one correct answer. Each possible answer should be 1-3 words. List in JSON format the following:

            "questions": [
                    {
                        "question": "[question]",
                            "A":"[option1]",
                            "B":"[option2]",
                            "C":"[option3]",
                            "D":"[option4]",
                        "answer: [letter]",
                        "explanation: ...",
                        ]
                    },
            ...
            }

            about the following passage:
        """ + "\n" + message
    }

    func versusPrompt(_ message: String) -> String {
        return """
            write a quiz with 10 questions about the chosen topic \(message) in the following json format. Each question must have four choices and one correct answer. Each possible answer should be 1-3 words. List in JSON format the following:

            "questions": [
                    {
                        "question": "[question]",
                            "A":"[option1]",
                            "B":"[option2]",
                            "C":"[option3]",
                            "D":"[option4]",
                        "answer: [letter]",
                        ]
                    },
                ...
            }
        """
    }

    func syllabusPrompt(_ message: String) -> String {
        // generate a syllabus about the chosen topic "\(message)" with 1-4 word sections and 4-6 subsections in plaintext format.
        print("calling syllabus prompt")
        return """
            Write a four paragraph explainer exclusively about \(message). Only use four paragraphs, each with a header.

        """
    }

    func sectionPrompt(_ message: String) -> String {
        return """
            generate a syllabus about the chosen topic "\(message)" in 6 subsections that encompass the topic. Format your answer as an array in the following json format:

            [
                "[section1]",
                "[section2]",
                "[section3]",
                ...
            ]
        """
    }
}
