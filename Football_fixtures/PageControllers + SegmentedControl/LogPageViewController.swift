//
//  LogPageViewController.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//


import UIKit

class LogPageViewController: UIPageViewController {
   
    var currentView: UIViewController?
    @IBOutlet weak var pageSwitchControl: UISegmentedControl!
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "First"),
                self.newColoredViewController(color: "Second"),
                self.newColoredViewController(color: "Third")]
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

    @IBAction func segmentedControlValueChanged(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        //print(index)
        
       
            setViewControllers([orderedViewControllers[index]],
                               direction: .forward,
                               animated: true,
                               completion: nil)
    }
    
}
