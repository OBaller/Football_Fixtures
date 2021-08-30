//
//  ViewController.swift
//  Football_fixtures
//
//  Created by IBE on 25/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gamesTableView: UITableView!
    
    fileprivate var footballData = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        
        fetchFixtures()
        
    }
    
    func fetchFixtures() {
        Service.shared.fetchData { (results, error) in
            if let error = error {
              print("Failed to fetch football data", error)
                return
            }
            self.footballData = results
            DispatchQueue.main.async {
                self.gamesTableView.reloadData()
//                print(results)
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.setup(with: footballData[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}

struct Fixtures: Decodable {
    var count: String?
//    var
}
