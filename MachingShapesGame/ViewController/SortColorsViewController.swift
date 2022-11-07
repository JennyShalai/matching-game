//
//  SecondGameViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/19/22.
//

import UIKit

class SortColorsViewController: UIViewController {
    
    @IBOutlet weak var yellowBasket: UIImageView!
    @IBOutlet weak var orangeBasket: UIImageView!
    @IBOutlet weak var greenBasket: UIImageView!
    @IBOutlet weak var redBasket: UIImageView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func reloadTapped(_ sender: UIButton) {
        for v in currentProductOnScreen {
            v.removeFromSuperview()
        }
        currentProductOnScreen = []
        setUI()
    }
    
    let data = DataService.data
    
    private var currentProductOnScreen = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    private func setUI() {
        var coordinats = FruitsVegetablesView.safeCoordinats
        for product in data.getProducts() {
            let productImageView = UIImageView(image: UIImage(named: product.image))
            productImageView.accessibilityIdentifier = product.color.rawValue
            view.addSubview(productImageView)
            currentProductOnScreen.append(productImageView)
            let randomIndex = Int.random(in: 0..<coordinats.count)
            let randomCoordinat = coordinats[randomIndex]
            coordinats.remove(at: randomIndex)
            
            // set constraint
            productImageView.translatesAutoresizingMaskIntoConstraints = false
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(randomCoordinat[0])).isActive = true
            productImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(randomCoordinat[1])).isActive = true
            productImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            productImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            addPanGesture(view: productImageView)
        }
    }
    
    private func addPanGesture(view: UIImageView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(pan)
        view.isUserInteractionEnabled = true
    }

    @objc func handlePan(_ guester: UIPanGestureRecognizer) {
        
        let foodView = guester.view!
        let translation = guester.translation(in: self.view)
        let foodColor = foodView.accessibilityIdentifier!
        
        switch guester.state {
        case .began, .changed:
            // move product with user finger
            foodView.layer.zPosition = 1
            foodView.center = CGPoint(x: foodView.center.x + translation.x, y: foodView.center.y + translation.y)
            guester.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            // remove product if the right basket
            if foodColor == ProductColor.green.rawValue && foodView.frame.intersects(greenBasket.frame) ||
               foodColor == ProductColor.orange.rawValue && foodView.frame.intersects(orangeBasket.frame) ||
               foodColor == ProductColor.yellow.rawValue && foodView.frame.intersects(yellowBasket.frame) ||
               foodColor == ProductColor.red.rawValue && foodView.frame.intersects(redBasket.frame) {
                    performFadeAnimation(forView: foodView)
            } else if foodColor == ProductColor.yellow.rawValue {
                if foodView.frame.intersects(greenBasket.frame) || foodView.frame.intersects(redBasket.frame) {
                    performBounceUpAnimation(forView: foodView)
                } else if foodView.frame.intersects(orangeBasket.frame) {
                    performBounceDownAnimation(forView: foodView)
                }
            } else if foodColor == ProductColor.orange.rawValue {
                if foodView.frame.intersects(greenBasket.frame) || foodView.frame.intersects(redBasket.frame) {
                    performBounceUpAnimation(forView: foodView)
                } else if foodView.frame.intersects(yellowBasket.frame) {
                    performBounceDownAnimation(forView: foodView)
                }
            } else if foodColor == ProductColor.green.rawValue {
                if foodView.frame.intersects(yellowBasket.frame) || foodView.frame.intersects(orangeBasket.frame) {
                    performBounceDownAnimation(forView: foodView)
                } else if foodView.frame.intersects(redBasket.frame) {
                    performBounceUpAnimation(forView: foodView)
                }
            } else if foodColor == ProductColor.red.rawValue {
                if foodView.frame.intersects(yellowBasket.frame) || foodView.frame.intersects(orangeBasket.frame) {
                    performBounceDownAnimation(forView: foodView)
                } else if foodView.frame.intersects(greenBasket.frame) {
                    performBounceUpAnimation(forView: foodView)
                }
            }
        default:
             break
        }
    }

    
    private func performFadeAnimation(forView view: UIView) {
        UIView.animate(withDuration: 0.6, animations: {
            view.alpha = 0.0
        })
    }
    
    private func performBounceUpAnimation(forView view: UIView) {
        UIView.animate(withDuration: 0.5, animations: {
            view.frame.origin.y -= 150.0
        })
    }
    
    private func performBounceDownAnimation(forView view: UIView) {
        UIView.animate(withDuration: 0.5, animations: {
            view.frame.origin.y += 150.0
        })
    }

}
