//
//  ViewController.swift
//  Football_fixtures
//
//  Created by IBE on 25/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gamesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}
