//
//  Game.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/18/22.
//

import Foundation

class Game {
    
    private(set) var gameTitle: String
    private(set) var gameImage: String
    private(set) var gameDescription: String
    
    init(title: String, description: String, image: String) {
        self.gameTitle = title
        self.gameImage = image
        self.gameDescription = description
    }
}
