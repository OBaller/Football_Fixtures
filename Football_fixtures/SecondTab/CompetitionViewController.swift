//
//  CompetitionViewController.swift
//  Football_fixtures
//
//  Created by IBE on 29/08/2021.
//

import UIKit

class CompetitionViewController: UIViewController {
    @IBOutlet weak var compTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compTableView.delegate = self
        compTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

}

extension CompetitionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompetitionTableViewCell
        return cell
    }
    
   
}
