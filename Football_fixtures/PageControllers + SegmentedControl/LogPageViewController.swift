//
//  LogPageViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import UIKit

class LogPageViewController: UIPageViewController {
    @IBOutlet weak var pageSwitchControl: UISegmentedControl!
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
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
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
