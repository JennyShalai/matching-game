//
//  GamesViewController.swift
//  MachingShapesGame
//
//  Created by Jenny Shalai on 7/18/22.
//

import UIKit

class GamesViewController: UIViewController {

    @IBOutlet weak var gamesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTable.dataSource = self
        gamesTable.delegate = self
    }

}

extension GamesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataService.data.getGames().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as? GameCell {
            let game = DataService.data.getGames()[indexPath.row]
            cell.updateCell(withGame: game)
            cell.selectionStyle = .none
            return cell
        } else {
            return GameCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameChosen = DataService.data.getGames()[indexPath.row]
        switch gameChosen.gameTitle {
        case GameTitle.gameSortFruitsVeggies:
            performSegue(withIdentifier: "FuitsVegetablesVC", sender: gameChosen)
        case GameTitle.gameSortByColors:
            performSegue(withIdentifier: "SortColorsVC", sender: gameChosen)
        case GameTitle.gameMatchShadow:
            performSegue(withIdentifier: "MatchShadowVC", sender: gameChosen)
        case GameTitle.gameDoesntBelong:
            performSegue(withIdentifier: "DoesntBelongVC", sender: gameChosen)
        case GameTitle.gameMaze:
            performSegue(withIdentifier: "MazeGame", sender: gameChosen)
        case GameTitle.gameWhosMissing:
            performSegue(withIdentifier: "WhosMissingGameVC", sender: gameChosen)
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
}
