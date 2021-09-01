//
//  BlueViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import UIKit

class TeamsViewController: UIViewController {
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
        teamsCollectionView.contentInset = .init(top: 20, left: 16, bottom: 0, right: 16)

    }

}

extension TeamsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
}

