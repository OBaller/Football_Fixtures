//
//  GreenViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var id: Int?
    fileprivate var tableData = [Table]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        print(id)
//        fetchStandings(id: id)
    }
    
    
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguetableTableViewCell", for: indexPath) as! LeaguetableTableViewCell
        cell.setup(with: tableData[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
}
