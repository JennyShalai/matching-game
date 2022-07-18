//
//  Product.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/16/22.
//

import Foundation

struct Product {
    
    let image: String
    let type: ProductType
    
    init(withImage image: String, type: ProductType) {
        self.image = image
        self.type = type
    }
}

enum ProductType: String {
    case vegetable
    case fruit
    
}

