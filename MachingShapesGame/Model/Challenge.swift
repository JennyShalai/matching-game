//
//  Challenge.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/27/22.
//

import Foundation
import UIKit

struct Challenge {
    
    let task: String
    let choices: [String]
    let answer: Int
    
    
    init(withImage image: String, choiceOne: String, choiceTwo: String, choiceThree: String, choiceFour: String, answer: Int) {
        self.task = image
        self.choices = [choiceOne, choiceTwo, choiceThree, choiceFour]
        self.answer = answer
    }
}
