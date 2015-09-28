//
//  OnboardingPageVC.swift
//  Bubs
//
//  Created by Matt Krueger on 9/25/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit


class OnboardingPageVC: UIPageViewController {

    func getIntroVC() -> IntroViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("IntroVC") as! IntroViewController
    }
    
    func getSecondIntroVC() -> SecondIntroViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("SecondIntroVC") as! SecondIntroViewController
    }
    
    override func viewDidLoad() {
        let pageControl = UIPageControl.appearance()
        
        pageControl.backgroundColor = UIColor.whiteColor()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        
        dataSource = self
        setViewControllers([getIntroVC()], direction: .Forward, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}

extension OnboardingPageVC : UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(SecondIntroViewController) {
            return getIntroVC()
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(IntroViewController) {
            return getSecondIntroVC()
        } else {
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
