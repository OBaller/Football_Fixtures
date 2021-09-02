//
//  leaguetableTableViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//
import UIKit

class LeaguetableTableViewCell: UITableViewCell {
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    var img: URL?
    
    func setup(with model: Table) {
        positionLabel.text = "\(model.position)"
        teamLabel.text = "\(model.team.name)"
        number1.text = "\(model.playedGames)"
        number2.text = "\(model.won)"
        number3.text = "\(model.points)"
        
        
    }
}
