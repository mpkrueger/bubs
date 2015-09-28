//
//  NewChildViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/24/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit

class NewChildViewController: UIViewController {

    @IBOutlet weak var childName: UITextField!
    @IBOutlet weak var childBirthdate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        if let childName = childName.text {
            let child = PFObject(className: "Children")
            child["name"] = childName
            child["birthdate"] = childBirthdate.date
            child["parent"] = PFUser.currentUser()
            
            child.saveInBackground()
            
            let childParentRelationship = PFObject(className: "childParentRelationships")
            childParentRelationship["parent"] = PFUser.currentUser()
            childParentRelationship["child"] = child
            childParentRelationship["role"] = "parent"
            
            childParentRelationship.saveInBackground()
        }
        
        let dashboard = self.storyboard?.instantiateViewControllerWithIdentifier("dashboard")
        self.showViewController(dashboard!, sender: dashboard)
    }
    

}
