//
//  BlueViewController.swift
//  Football_fixtures
//
//  Created by naseem on 01/09/2021.
//
import UIKit

class TeamsViewController: UIViewController {
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    var teamcrest = [Table]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
//        teamsCollectionView.contentInset = .init(top: 10, left: 5, bottom: 5, right: 5)
        fetchTeams()
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
               // print(results)
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
        return .init(width: (view.frame.width - 30) / 3, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .init(5)
    }
    
}

