//
//  MazeGameViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/25/22.
//

import UIKit
import SpriteKit
import GameplayKit

class MazeGameViewController: UIViewController {
    
    @IBOutlet weak var viewContainer: SKView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewContainer = self.viewContainer {
            // Load the SKScene from 'MazeScene.sks'
            if let scene = SKScene(fileNamed: "MazeScene") {
                scene.scaleMode = .aspectFit // change to .aspetFill if prevent landscape
                scene.size = viewContainer.bounds.size
                print(scene.size)
                viewContainer.presentScene(scene)
            }
            viewContainer.ignoresSiblingOrder = true
            viewContainer.showsFPS = true
            viewContainer.showsNodeCount = true
        }
    }
}
