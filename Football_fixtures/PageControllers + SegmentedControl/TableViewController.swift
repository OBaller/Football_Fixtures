//
//  GreenViewController.swift
//  Football_fixtures
//
//  Created by naseem on 01/09/2021.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
   
     var log = [Table]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        fetchStandings()
    }
    
    func fetchStandings() {
        StandingsService.shared.fetchLog { (results, error) in
            if let error = error {
                print("Failed to fetch data", error)
                return
        }
            self.log = results
            DispatchQueue.main.async {
                self.table.reloadData()
                //print(results)
            }
    }
}
    
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return log.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguetableTableViewCell", for: indexPath) as! LeaguetableTableViewCell
        cell.setup(with: log[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

