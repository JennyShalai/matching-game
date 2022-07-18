//
//  Data.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/17/22.
//

import Foundation

class DataService {
    
    private init(){}
    static let data = DataService()
    
    private let products = [Product(withImage: ImageURL.apple, type: .fruit),
                            Product(withImage: ImageURL.banana, type: .fruit),
                            Product(withImage: ImageURL.grapes, type: .fruit),
                            Product(withImage: ImageURL.kiwi, type: .fruit),
                            Product(withImage: ImageURL.potato, type: .vegetable),
                            Product(withImage: ImageURL.broccoli, type: .vegetable),
                            Product(withImage: ImageURL.tomato, type: .vegetable),
                            Product(withImage: ImageURL.corn, type: .vegetable)]
    
    func getProducts() -> [Product] {
        return products
    }
}
