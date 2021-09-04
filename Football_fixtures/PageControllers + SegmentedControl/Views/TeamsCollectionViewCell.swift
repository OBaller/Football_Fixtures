//
//  TeamsCollectionViewCell.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//
import Kingfisher
import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamCrest: UIImageView!
    
    func setup(with model: Table) {
        teamCrest.kf.setImage(with: model.team.crestURL?.asUrl)

    }
}


