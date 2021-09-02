//
//  CompetitionViewController.swift
//  Football_fixtures
//
//  Created by IBE on 29/08/2021.
//

import UIKit

class CompetitionViewController: UIViewController {
    @IBOutlet weak var compTableView: UITableView!
    fileprivate var competition = [Competition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        compTableView.delegate = self
        compTableView.dataSource = self

        fetchCompetition()
    }
    
    func fetchCompetition() {
        CompetitionService.shared.fetchLeagues { (results, error) in
            if let error = error {
              print("Failed to fetch football data", error)
                return
            }
            self.competition = results
            DispatchQueue.main.async {
                self.compTableView.reloadData()
              // print(results)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "LogPageViewController") as? LogPageViewController else {
            return
        }
        let controller = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "GreenViewController") as! TableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

