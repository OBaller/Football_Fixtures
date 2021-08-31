//
//  CompetitionTableViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 29/08/2021.
//

import UIKit

class CompetitionTableViewCell: UITableViewCell {
    @IBOutlet weak var competitionLabel: UILabel!
    
    func setup(with model: Competition) {
        competitionLabel.text = "\(model.name)"
    }

}
