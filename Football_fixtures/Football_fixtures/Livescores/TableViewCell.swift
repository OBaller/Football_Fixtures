//
//  TableViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 27/08/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var gameWeekLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    
    func setup(with model: Match) {
        
        homeTeamLabel.text = "\(model.homeTeam.name)"
        awayTeamLabel.text = "\(model.awayTeam.name)"
        gameWeekLabel.text = "MD:\(model.matchday)"
        homeScoreLabel.text = "\(model.score.fullTime.homeTeam ?? 0)"
        awayScoreLabel.text = "\(model.score.fullTime.awayTeam ?? 0)"
        matchTimeLabel.text = "\(model.status.rawValue)"
        print("\(model.competition)")
       
    }

}
