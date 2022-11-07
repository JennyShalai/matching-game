//
//  GameCell.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/18/22.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    func updateCell(withGame game: Game) {
        gameImage.image = UIImage(named: game.gameImage)
        gameTitle.text = "" // game.gameTitle
        gameDescription.text = game.gameDescription
    }

}
