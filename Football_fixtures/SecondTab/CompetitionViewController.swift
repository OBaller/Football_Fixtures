//
//  CompetitionViewController.swift
//  Football_fixtures
//
//  Created by IBE on 29/08/2021.
//

import UIKit

class CompetitionViewController: UIViewController {
    @IBOutlet weak var compTableView: UITableView!
    var competition = [Competition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        compTableView.delegate = self
        compTableView.dataSource = self

        fetchCompetition()
    }
    
    func fetchCompetition() {
        
        Service.shared.fetchData { (result, error) in
            if let error = error {
              print("Failed to fetch football data", error)
                return
            }
            
            result.forEach({test in
                self.competition.append(test.competition)
//                print(test.competition)
            })
            
//            guard let result = result else { return }
//            self.competition = [result]
            DispatchQueue.main.async {
                self.compTableView.reloadData()
//                print(results)
            }
        }
    }

}

extension CompetitionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompetitionTableViewCell
        cell.setup(with: competition[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}
