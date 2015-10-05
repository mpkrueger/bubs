//
//  FeedingRecordViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/27/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit

class FeedingRecordViewController: UIViewController, UITextFieldDelegate {
    
    var child: PFObject?
    var breastSide: String!
    
    @IBOutlet weak var breastToggle: UISegmentedControl!
    @IBOutlet weak var feedingNotes: UITextField!
    @IBOutlet weak var volume: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedingNotes.delegate = self
        self.volume.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        feedingNotes.resignFirstResponder()
        volume.resignFirstResponder()
        return true
    }
    
    @IBAction func breastChoice(sender: UISegmentedControl) {
        switch breastToggle.selectedSegmentIndex
        {
        case 0:
            breastSide = "Left"
        case 1:
            breastSide = "Right"
        default:
            break
        }
    }
    
    @IBAction func saveFeeding(sender: AnyObject) {
        if breastSide == nil {
            breastSide = "Left"
        }
        
        let feeding = PFObject(className: "Feedings")
        feeding["breastSide"] = breastSide
        feeding["volume"] = Int(volume.text!)
        feeding["notes"] = feedingNotes.text
        feeding["child"] = child
        
        feeding.saveInBackground()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
