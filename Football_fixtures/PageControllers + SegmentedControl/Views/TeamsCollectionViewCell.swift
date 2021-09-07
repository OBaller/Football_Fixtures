//
//  TeamsCollectionViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import UIKit
import SDWebImage

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamCrest: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    
    func setup(with model: Table) {
        guard let url = model.team.crestURL else {
            return
        }
        teamCrest.sd_setImage(with: URL(string: url))
        teamName.text = model.team.name
    }
}


