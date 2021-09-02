//
//  ViewController.swift
//  Football_fixtures
//
//  Created by IBE on 25/08/2021.
//

import UIKit

class ViewController: UIViewController {
    var refreshControl = UIRefreshControl()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var timer = Timer()
    let delay = 4.5
    
    @IBOutlet weak var gamesTableView: UITableView!
    
    fileprivate var footballData = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .black
        
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        view.addConstraint(verticalConstraint)
        fetchFixtures()
        indicateActivity()
        refreshControl = UIRefreshControl()
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
            refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        gamesTableView.addSubview(refreshControl)
    }

    func fetchFixtures() {
        LiveScoreService.shared.fetchData { (results, error) in
            if let error = error {
                print("Failed to fetch football data", error)
                return
            }
            self.footballData = results
            DispatchQueue.main.async {
                self.gamesTableView.reloadData()
                print(self.footballData)
            }
        }
    }
    
    @objc func delayedAction(){
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating();
        }
    }
    
    func indicateActivity () {
        activityIndicator.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(delayedAction), userInfo: nil, repeats: false)
    }
    
    @objc func refresh(_ sender: Any) {
        fetchFixtures()
        refreshControl.endRefreshing()
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
