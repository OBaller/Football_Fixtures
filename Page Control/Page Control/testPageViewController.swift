//
//  firstPageViewController.swift
//  Page Control
//
//  Created by IBE on 31/08/2021.
//

import UIKit

class testPageViewController: UIPageViewController {
    
    
    var currentView: UIViewController?
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
//        dataSource = self
        
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
        
//            if let firstViewController = orderedViewControllers[index] {
//            setViewControllers([firstViewController],
//                               direction: .forward,
//                               animated: true,
//                               completion: nil)
//        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if sender.selectedSegmentIndex == 0 {
//            let vc = storyboard.instantiateViewController(withIdentifier: "GreenViewController")
////                .instantiateViewControllerWithIdentifier("RedViewController")
//            pageViewController.setViewControllers([vc!], direction: .forward, animated: false, completion: nil)
//        } else if sender.selectedSegmentIndex == 1 {
//            let vc = storyboard?.instantiateViewControllerWithIdentifier("BlueViewController")
//            pageViewController.setViewControllers([vc!], direction: .Forward, animated: true, completion: nil)
//        }
//        else {
//            let vc = storyboard?.instantiateViewControllerWithIdentifier("BlueViewController")
//            pageViewController.setViewControllers([vc!], direction: .Forward, animated: true, completion: nil)
//        }
    }
    
}

// MARK: UIPageViewControllerDataSource

//extension testPageViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
////
////        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
////            return nil
////        }
////
////            let previousIndex = viewControllerIndex - 1
////
////            guard previousIndex >= 0 else {
////                return nil
////            }
////            guard self.orderedViewControllers.count > previousIndex else {
////                return nil
////            }
////           return orderedViewControllers[previousIndex]
//        return UIViewController()
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
////        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
////            return nil
////        }
////        let nextIndex = viewControllerIndex + 1
////        let orderedViewControllersCount = orderedViewControllers.count
////
////        guard orderedViewControllersCount != nextIndex else {
////            return nil
////        }
////        guard orderedViewControllersCount > nextIndex else {
////            return nil
////        }
////        completion = { val in
////            print(val)
////            self.currentView = self.orderedViewControllers[val]
////        }
////        return currentView
//
//        return UIViewController()
//    }
//
////    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
////        return orderedViewControllers.count
////    }
////
////    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
////        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.firstIndex(of:firstViewController) else {
////            return 0
////        }
////
////        return firstViewControllerIndex
////    }
//
//}

