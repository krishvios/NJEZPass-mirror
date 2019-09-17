//
//  NewsRoomViewController.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 10/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class NewsRoomViewController: UIPageViewController {
    
     weak var newsRoomDelegate: NewsRoomViewControllerDelegate?
    
    private(set) lazy var newsRoomViews: [UIViewController] = {
        // The view controllers will be shown in this order
        return [self.newsRoomVC("NewsRoom"),//NewsRoomViewController
                self.newsRoomVC("NewsRoom"),
                self.newsRoomVC("NewsRoom")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = newsRoomViews.first {
            scrollToViewController(viewController: initialViewController)
        }
        
        newsRoomDelegate?.NewsRoomViewController(NewsRoomViewController: self, didUpdatePageCount: newsRoomViews.count)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
            scrollToViewController(viewController: nextViewController)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.
     
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = newsRoomViews.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = newsRoomViews[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    func newsRoomVC(_ viewCtrl: String) -> UIViewController {
        return UIStoryboard(name: "UserFlow", bundle: nil) .
            instantiateViewController(withIdentifier: "NewsRoomViewController")
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'tutorialDelegate' of the new index.
                            self.notifyDelegateOfNewIndex()
        })
    }
    
    /**
     Notifies '_tutorialDelegate' that the current page index was updated.
     */
    private func notifyDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = newsRoomViews.firstIndex(of: firstViewController) {
            newsRoomDelegate?.NewsRoomViewController(NewsRoomViewController: self, didUpdatePageIndex: index)
            

        }
    }
}
extension NewsRoomViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = newsRoomViews.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return newsRoomViews.last
        }
        
        guard newsRoomViews.count > previousIndex else {
            return nil
        }
        
        return newsRoomViews[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = newsRoomViews.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let newsRoomViewControllersCount = newsRoomViews.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard newsRoomViewControllersCount != nextIndex else {
            return newsRoomViews.first
        }
        
        guard newsRoomViewControllersCount > nextIndex else {
            return nil
        }
        
        return newsRoomViews[nextIndex]
    }
    
}

extension NewsRoomViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifyDelegateOfNewIndex()
    }
    
}

protocol NewsRoomViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func NewsRoomViewController(NewsRoomViewController: NewsRoomViewController,
                                    didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func NewsRoomViewController(NewsRoomViewController: NewsRoomViewController,
                                    didUpdatePageIndex index: Int)
    
}
