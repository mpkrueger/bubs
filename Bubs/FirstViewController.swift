//
//  FirstViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/20/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FirstViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var child: PFObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dashboard = self.tabBarController as! DashboardViewController
        child = dashboard.child
        print(child)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if PFUser.currentUser() == nil {
            let onboardingVC = self.storyboard?.instantiateViewControllerWithIdentifier("OnboardingPageVC")
            self.showViewController(onboardingVC!, sender: onboardingVC)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RecordChanging" {
            let diaper = segue.destinationViewController as! DiaperChangeViewController
            diaper.child = child
        } else if segue.identifier == "RecordFeeding" {
            
        }
    }

}

