//
//  TableViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 27/08/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var gameWeekLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    
    func setup(with model: Match) {
        
        guard let homeScore = model.score.fullTime.homeTeam,
              let awayScore = model.score.fullTime.awayTeam else {
            return
        }
        
        homeTeamLabel.text = "\(model.homeTeam.name)"
        awayTeamLabel.text = "\(model.awayTeam.name)"
        gameWeekLabel.text = "\(model.matchday)"
        homeScoreLabel.text = "\(homeScore)"
        awayScoreLabel.text = "\(awayScore)"
        timerLabel.text = "\(model.status.rawValue)"
        
    }

}
