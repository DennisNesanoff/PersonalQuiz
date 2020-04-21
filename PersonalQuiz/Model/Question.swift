//
//  Question.swift
//  PersonalQuiz
//
//  Created by Dennis Nesanoff on 23.10.2019.
//  Copyright © 2019 Dennis Nesanoff. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var typeQuestion: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "What kind of food do you prefer?",
                     typeQuestion: .single,
                     answers: [
                        Answer(text: "Steak", type: .dog),
                        Answer(text: "Fish", type: .cat),
                        Answer(text: "Carrot", type: .rabbit),
                        Answer(text: "Corn", type: .turtle)
                ]
            ),
            Question(text: "What do you like more?",
                     typeQuestion: .multiple,
                     answers: [
                        Answer(text: "Swim", type: .dog),
                        Answer(text: "Sleep", type: .cat),
                        Answer(text: "Cuddle", type: .rabbit),
                        Answer(text: "Eat", type: .turtle)
                ]
            ),
            Question(text: "Do you like traveling by car?",
                     typeQuestion: .ranged,
                     answers: [
                        Answer(text: "I hate", type: .dog),
                        Answer(text: "Nervous", type: .cat),
                        Answer(text: "Do not notice", type: .rabbit),
                        Answer(text: "Love", type: .turtle)
                ]
            )
        ]
    }
}
