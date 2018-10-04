//
//  Topic.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import Foundation

class Topic {
    let name: String
    var questions: [Question]
    
    init(name: String, questions: [Question] = []) {
        self.name = name
        self.questions = questions
    }
}
