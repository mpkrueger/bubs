//
//  MoreViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/20/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MoreViewController: UIViewController {

    @IBOutlet weak var invitationEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitInvitation(sender: AnyObject) {
        let invitee = PFObject(className: "Invitations")
        invitee["emailAddress"] = invitationEmail.text
        invitee["inviter"] = PFUser.currentUser()
        invitee["consumed"] = false
        
        invitee.saveInBackground()
    }
    
    @IBAction func logout(sender: AnyObject) {
        PFUser.logOut()
        print("user logged out")
        let firstViewVC = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewVC")
        self.showViewController(firstViewVC!, sender: firstViewVC)
    }
    

}
