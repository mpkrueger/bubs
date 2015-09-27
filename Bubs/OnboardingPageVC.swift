//
//  OnboardingPageVC.swift
//  Bubs
//
//  Created by Matt Krueger on 9/25/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit


class OnboardingPageVC: UIPageViewController {

    var introVC : UIViewController!
    var signUpVC : UIViewController!
    var newChildVC : UIViewController!
    
    func getIntroVC() -> IntroViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("IntroVC") as! IntroViewController
    }
    
    func getSignUpVC() -> SignUpViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("SignUpVC") as! SignUpViewController
    }
    
    func getNewChildVC() -> NewChildViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("NewChildVC") as! NewChildViewController
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
    
    func nextButtonPressed(sender: AnyObject) {
        let nextVC : NSArray = [newChildVC]
        
        setViewControllers(nextVC as? [UIViewController], direction: .Forward, animated: true, completion: nil)
    }

}

extension OnboardingPageVC : UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(NewChildViewController) {
            return getSignUpVC()
        } else if viewController.isKindOfClass(SignUpViewController) {
            return getIntroVC()
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(IntroViewController) {
            return getSignUpVC()
        } else if viewController.isKindOfClass(SignUpViewController) {
            return getNewChildVC()
        } else {
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
