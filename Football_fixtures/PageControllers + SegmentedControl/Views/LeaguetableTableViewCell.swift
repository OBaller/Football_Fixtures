//
//  leaguetableTableViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//
import SDWebImage
import UIKit

class LeaguetableTableViewCell: UITableViewCell {
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    
    func setup(with model: Table) {
        positionLabel.text = "\(model.position)"
        textLabel?.text = "\(model.team)"
        number1.text = "\(model.points)"
        number2.text = "\(model.playedGames)"
        number3.text = "\(model.won)"
       //teamLogo.sd_setImage(with: URL(string: model.team.crestURL))
    }
}
