//
//  MatchShadowViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/24/22.
//

import UIKit

class MatchShadowViewController: UIViewController {
    @IBOutlet var products: [UIImageView]!
    @IBOutlet var shadows: [UIImageView]!

    private var productsOrigin = [CGPoint]()
    private var shadowsOrigin = [CGPoint]()
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func reloadTapped(_ sender: UIButton) {
        reloadUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        getOrigins()
        reloadUI()
    }

    private func reloadUI() {
        for (index, product) in products.enumerated() {
            product.frame.origin.x = productsOrigin[index].x
            product.frame.origin.y = productsOrigin[index].y
        }
    }
    
    private func setUI() {
        for product in products {
            addPanGesture(view: product)
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
        switch guester.state {
        case .began, .changed:
            // move product with user finger
            foodView.layer.zPosition = 1
            foodView.center = CGPoint(x: foodView.center.x + translation.x, y: foodView.center.y + translation.y)
            guester.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            cheackIntersection(forProduct: foodView)
        default:
             break
        }
    }
    
    private func cheackIntersection(forProduct product: UIView) {
        for shadow in shadows {
            if product.frame.intersects(shadow.frame) &&
                product.accessibilityIdentifier == shadow.accessibilityIdentifier {
                product.frame.origin = shadow.frame.origin
                product.isUserInteractionEnabled = false
            }
        }
    }
    
    private func getOrigins() {
        getProductsOrigins()
        getShadowssOrigins()
    }
    
    private func getProductsOrigins() {
        for product in products {
            productsOrigin.append(product.frame.origin)
        }
    }
    
    private func getShadowssOrigins() {
        for shadow in shadows {
            shadowsOrigin.append(shadow.frame.origin)
        }
    }
    

}
