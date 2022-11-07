//
//  WhosMissingViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/27/22.
//

import UIKit

class WhosMissingViewController: UIViewController {
    
    @IBOutlet weak var challenge: UIImageView!
    @IBOutlet var choices: [UIButton]!
    
    private let dataChallenge = DataService.data.getChallenges()
    private var challengeNumber = 0
    
    @IBAction func choiceTapped(_ sender: UIButton) {
        if sender.accessibilityIdentifier == "answer" {
            // animate "good job" here
            setChallengeUI()
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func reloadTapped(_ sender: UIButton) {
        setChallengeUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setChallengeUI()
    }
    
    private func setChallengeUI() {
        if challengeNumber < dataChallenge.count {
            let currentChallenge = dataChallenge[challengeNumber]
            challenge.image = UIImage(named: currentChallenge.task)
            let answer = currentChallenge.answer
            let currentChoices = currentChallenge.choices
            for (index, choice) in choices.enumerated() {
                choice.setImage(UIImage(named: currentChoices[index]), for: .normal)
                choice.imageView?.contentMode = .scaleAspectFit
                if index == answer {
                    choice.accessibilityIdentifier = "answer"
                } else {
                    choice.accessibilityIdentifier = ""
                }
            }
            challengeNumber += 1
        } else {
            challengeNumber = 0
            setChallengeUI()
        }
    }
    
}
