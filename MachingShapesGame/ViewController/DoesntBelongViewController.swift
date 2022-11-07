//
//  DoesntBelongViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/24/22.
//

import UIKit

class DoesntBelongViewController: UIViewController {

    private let dataChallenge = DataService.data.getDoesntBelongChallenges()
    private var challengeNumber = 0
    
    @IBOutlet var choices: [UIButton]!
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func choiceTapped(_ sender: UIButton) {
        if sender.accessibilityIdentifier == "answer" {
            // animate "good job" here
            setChallengeUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setChallengeUI()
    }

    
    private func setChallengeUI() {
        if challengeNumber < dataChallenge.count {
            let currentChallenge = dataChallenge[challengeNumber]
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




