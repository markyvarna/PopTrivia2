//
//  Question.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let correctAnswer: Bool
    
    init(questionText: String, correctAnswer: Bool){
        self.questionText = questionText
        self.correctAnswer = correctAnswer
    }
}
