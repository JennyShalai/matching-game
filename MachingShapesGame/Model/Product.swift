//
//  Product.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/16/22.
//

import Foundation

struct Product {
    
     let image: String
     let type: ProductType   // for sorting greens game
     let color: ProductColor // for sorting colors game
    
    init(withImage image: String, type: ProductType, color: ProductColor) {
        self.image = image
        self.type = type
        self.color = color
    }
}

enum ProductType: String {
    case vegetable
    case fruit
}

enum ProductColor: String {
    case green
    case orange
    case red
    case yellow
    case na
    
}

