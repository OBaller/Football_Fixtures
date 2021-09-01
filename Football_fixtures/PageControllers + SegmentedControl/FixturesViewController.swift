//
//  RedViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import UIKit

class FixturesViewController: UIViewController {
    @IBOutlet weak var fixtures: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fixtures.dataSource = self
        fixtures.delegate = self
    }

}

extension FixturesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixturesTableViewCell", for: indexPath) as! FixturesTableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
}
