//
//  ViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/14/22.
//

import UIKit

class SortFruitsVegetablesViewController: UIViewController {
    
    @IBOutlet weak var vegetableBasketImage: UIImageView!
    @IBOutlet weak var fruitBasketImage: UIImageView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        print("back tapped")
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
            productImageView.accessibilityIdentifier = product.type.rawValue
            view.addSubview(productImageView)
            currentProductOnScreen.append(productImageView)
            let randomIndex = Int.random(in: 0..<coordinats.count)
            let randomCoordinat = coordinats[randomIndex]
            coordinats.remove(at: randomIndex)
            
            // set constraint
            productImageView.translatesAutoresizingMaskIntoConstraints = false
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(randomCoordinat[0])).isActive = true
            productImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(randomCoordinat[1])).isActive = true
            productImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
            productImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
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
        let foodtype = foodView.accessibilityIdentifier!
        switch guester.state {
        case .began, .changed:
            // move product with user finger
            foodView.layer.zPosition = 1
            foodView.center = CGPoint(x: foodView.center.x + translation.x, y: foodView.center.y + translation.y)
            guester.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            // remove product if the right basket
            if (foodtype == ProductType.vegetable.rawValue && foodView.frame.intersects(vegetableBasketImage.frame)) ||
                (foodtype == ProductType.fruit.rawValue    && foodView.frame.intersects(fruitBasketImage.frame)) {
                performFadeAnimation(forView: foodView)
            } else if (foodtype == ProductType.vegetable.rawValue && foodView.frame.intersects(fruitBasketImage.frame)) ||
                      (foodtype == ProductType.fruit.rawValue && foodView.frame.intersects(vegetableBasketImage.frame)) {
                performBounceAnimation(forView: foodView)
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
    
    private func performBounceAnimation(forView view: UIView) {
        UIView.animate(withDuration: 0.5, animations: {
            view.frame.origin.y -= 150.0
        })
    }
    
}

