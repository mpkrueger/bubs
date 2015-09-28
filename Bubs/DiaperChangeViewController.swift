//
//  DiaperChangeViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/27/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit

class DiaperChangeViewController: UIViewController {
    var soil: String!
    var child: PFObject?

    @IBOutlet weak var diaperNotes: UITextField!
    @IBOutlet weak var soilType: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let query = PFQuery(className: "childParentRelationships")
//        query.whereKey("parent", equalTo: PFUser.currentUser()!)
//        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
//            if error == nil {
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                        self.child = object["child"] as! PFObject
//                    }
//                }
//            }
//        }
        
        print(child)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func soilChoice(sender: UISegmentedControl) {
        switch soilType.selectedSegmentIndex
        {
            case 0:
                soil = "Pee"
            case 1:
                soil = "Poop"
            default:
                break
        }
    }
    

    
    @IBAction func saveDiaperChange(sender: AnyObject) {
        if soil == nil {
            soil = "Pee"
        }
        
        let diaper = PFObject(className: "Diapers")
        diaper["soilType"] = soil
        diaper["notes"] = diaperNotes.text
        diaper["child"] = child
        
        diaper.saveInBackground()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}