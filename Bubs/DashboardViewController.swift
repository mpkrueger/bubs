//
//  DashboardViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/27/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit

class DashboardViewController: UITabBarController {
    var child: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let query = PFQuery(className: "childParentRelationships")
//        query.whereKey("parent", equalTo: PFUser.currentUser()!)
//        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
//            if error == nil {
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                        self.child = object["child"] as? PFObject
//                    }
//                }
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
