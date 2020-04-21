//
//  AnimalType.swift
//  PersonalQuiz
//
//  Created by Dennis Nesanoff on 21.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import Foundation

enum AnimalType: String {
    case cat = "🐱"
    case dog = "🐶"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition: String {
        switch self {
        case .cat:
            return "You by yourself and value solitude."
        case .dog:
            return "You like to be with friends. You are always ready to help."
        case .rabbit:
            return "You like everything soft. You are healthy and full of energy."
        case .turtle:
            return "Your strength is in wisdom. Slow and thoughtful wins a long distance."
        }
    }
}
