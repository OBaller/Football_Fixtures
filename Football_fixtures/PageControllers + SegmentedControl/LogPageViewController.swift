//
//  LogPageViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import UIKit

class LogPageViewController: UIPageViewController {
    @IBOutlet weak var pageSwitchControl: UISegmentedControl!
    var id: Int?
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "Green"),
                self.newColoredViewController(color: "Red"),
                self.newColoredViewController(color: "Blue")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        fetchStandings(id: id)
        
    }
    
    func fetchStandings(id: Int?) {
        guard let id = id else {
            return
        }
        StandingsService.shared.fetchLog(LeagueId: id) { (results, error) in
            print(results)
        }
    }
    
    
    @IBAction func segmentedControlValueChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        setViewControllers([orderedViewControllers[index]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
        
    }
}
