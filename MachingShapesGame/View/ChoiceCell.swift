//
//  ChoiceCell.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/29/22.
//

import UIKit

class ChoiceCell: UICollectionViewCell {
    
    @IBOutlet weak var choiceImage: UIImageView!
    
    func updateCell(withImage image: UIImage) {
        choiceImage.image = image
    }
}
