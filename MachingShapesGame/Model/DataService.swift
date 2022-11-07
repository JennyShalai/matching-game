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
    
    // if adding new Product, new safecoordinat has to be added
    private let products = [Product(withImage: ImageURL.appleRed, type: .fruit, color: .red),
                            Product(withImage: ImageURL.appleGreen, type: .fruit, color: .green),
                            Product(withImage: ImageURL.pepperRed, type: .vegetable, color: .red),
                            Product(withImage: ImageURL.pepperOrange, type: .vegetable, color: .orange),
                            Product(withImage: ImageURL.pepperYellow, type: .vegetable, color: .yellow),
                            Product(withImage: ImageURL.chilliPepperYellow, type: .vegetable, color: .yellow),
                            Product(withImage: ImageURL.chilliPepperGreen, type: .vegetable, color: .green),
                            Product(withImage: ImageURL.chilliPepperRed, type: .vegetable, color: .red),
                            Product(withImage: ImageURL.cherries, type: .fruit, color: .red),
                            Product(withImage: ImageURL.lettuceRomaine, type: .vegetable, color: .green),
                            Product(withImage: ImageURL.tomato, type: .vegetable, color: .red)]
    
    private let games = [Game(title: GameTitle.gameSortFruitsVeggies,
                              description: "sort fruits and veggies",
                              image: ImageURL.gameSortFruitsVegetables),
                         Game(title: GameTitle.gameSortByColors,
                              description: "sortying by colors",
                              image: ImageURL.gameSortColor),
                         Game(title: GameTitle.gameMatchShadow,
                              description: "matching shapes",
                              image: ImageURL.gameMatchShadow),
                         Game(title: GameTitle.gameMaze,
                              description: "Enjoy the maze!",
                              image: ImageURL.gameMaze),
                         Game(title: GameTitle.gameWhosMissing,
                              description: "Who is missing here?",
                              image: ImageURL.gameWhosMissing),
                         Game(title: GameTitle.gameDoesntBelong,
                              description: "Who does not belong?",
                              image: ImageURL.gameWhosMissing)]
    
    private let missingChallenges = [Challenge(withImage: ImageURL.missingChallengeOne,
                                        choiceOne: ImageURL.bananas,
                                        choiceTwo: ImageURL.cherries,
                                        choiceThree: ImageURL.cabbageGreen,
                                        choiceFour: ImageURL.orange,
                                        answer: 2),
                              Challenge(withImage: ImageURL.missingChallengeTwo,
                                        choiceOne: ImageURL.cherries,
                                        choiceTwo: ImageURL.bananas,
                                        choiceThree: ImageURL.pepperRed,
                                        choiceFour: ImageURL.lemon,
                                        answer: 0),
                              Challenge(withImage: ImageURL.missingChallengeThree,
                                        choiceOne: ImageURL.pepperOrange,
                                        choiceTwo: ImageURL.lemon,
                                        choiceThree: ImageURL.appleRed,
                                        choiceFour: ImageURL.corn,
                                        answer: 1),
                              Challenge(withImage: ImageURL.missingChallengeFour,
                                        choiceOne: ImageURL.corn,
                                        choiceTwo: ImageURL.pepperYellow,
                                        choiceThree: ImageURL.cabbageRed,
                                        choiceFour: ImageURL.appleRed,
                                        answer: 3),
                              Challenge(withImage: ImageURL.missingChallengeFive,
                                        choiceOne: ImageURL.lemon,
                                        choiceTwo: ImageURL.orange,
                                        choiceThree: ImageURL.pepperRed,
                                        choiceFour: ImageURL.appleGreen,
                                        answer: 2)]
    
    private let doesntBelongChallenges = [Challenge(withImage: "",
                                                    choiceOne: ImageURL.lettuceRomaine,
                                                    choiceTwo: ImageURL.cauliflower,
                                                    choiceThree: ImageURL.cabbageGreen,
                                                    choiceFour: ImageURL.potato,
                                                    answer: 3),
                                          Challenge(withImage: "",
                                                    choiceOne: ImageURL.cherries,
                                                    choiceTwo: ImageURL.bananas,
                                                    choiceThree: ImageURL.pepperRed,
                                                    choiceFour: ImageURL.lemon,
                                                    answer: 0),
                                          Challenge(withImage: "",
                                                    choiceOne: ImageURL.pepperOrange,
                                                    choiceTwo: ImageURL.lemon,
                                                    choiceThree: ImageURL.appleRed,
                                                    choiceFour: ImageURL.corn,
                                                    answer: 1),
                                          Challenge(withImage: "",
                                                    choiceOne: ImageURL.corn,
                                                    choiceTwo: ImageURL.pepperYellow,
                                                    choiceThree: ImageURL.cabbageRed,
                                                    choiceFour: ImageURL.appleRed,
                                                    answer: 3),
                                          Challenge(withImage: "",
                                                    choiceOne: ImageURL.lemon,
                                                    choiceTwo: ImageURL.orange,
                                                    choiceThree: ImageURL.pepperRed,
                                                    choiceFour: ImageURL.appleGreen,
                                                    answer: 2)]
    
    
    func getProducts() -> [Product] {
        return products
    }
    
    func getGames() -> [Game] {
        return games
    }
    
    func getChallenges() -> [Challenge] {
        return missingChallenges
    }
    
    func getDoesntBelongChallenges() -> [Challenge] {
        return doesntBelongChallenges
    }
}
