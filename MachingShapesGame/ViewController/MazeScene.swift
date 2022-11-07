//
//  MazeScene.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/25/22.
//

import SpriteKit
import CoreMotion
import GameplayKit


class Apple: SKSpriteNode { }

class MazeScene: SKScene {
    
    var motionManager: CMMotionManager?
    
    override func didMove(to view: SKView) {
        
        let tomato = SKSpriteNode(imageNamed: "tomato")
        tomato.size = CGSize(width: 40.0, height: 40.0)
        tomato.position = CGPoint(x: 40.0, y: 320.0)
        tomato.name = "tomato"
        tomato.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50.0, height: 50.0))
        tomato.physicsBody?.allowsRotation = true
        tomato.physicsBody?.restitution = 0.05 // how bouncy tomato is
        tomato.zPosition = 1
        addChild(tomato)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)))
        
        motionManager = CMMotionManager()
        motionManager?.startAccelerometerUpdates()
        motionManager?.accelerometerUpdateInterval = 0.1
      
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // call before each frame is rendered
        if let accelerometerData = motionManager?.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 10.0, dy: accelerometerData.acceleration.y * 10.0)
        }
    }
}
