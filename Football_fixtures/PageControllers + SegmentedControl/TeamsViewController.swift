//
//  BlueViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//
import UIKit

class TeamsViewController: UIViewController {
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    var teamcrest = [Table]()
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
        teamsCollectionView.contentInset = .init(top: 20, left: 16, bottom: 0, right: 16)

    }
    
    func fetchTeams() {
        StandingsService.shared.fetchLog { (results, error) in
            if let error = error {
                print("Failed to fetch data", error)
                return
        }
            self.teamcrest = results
            DispatchQueue.main.async {
                self.teamsCollectionView.reloadData()
                print(results)
            }
    }
}

}

extension TeamsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamcrest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        cell.setup(with: teamcrest[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 200)
    }
    
}

