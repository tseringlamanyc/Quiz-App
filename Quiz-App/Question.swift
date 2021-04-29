//
//  Question.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/26/21.
//

import Foundation

struct Question: Decodable {
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
