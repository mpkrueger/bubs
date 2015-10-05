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
    var dataSource: AppDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = AppDataSource()
        dataSource?.queryForData()
        child = dataSource?.bubsData["child"] as? PFObject
        print(child!)
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
            diaper.child = self.child
        } else if segue.identifier == "RecordFeeding" {
            let feeding = segue.destinationViewController as! FeedingRecordViewController
            feeding.child = self.child
        }
    }

}

