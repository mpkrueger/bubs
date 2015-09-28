//
//  SignUpViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/25/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitEmail(sender: AnyObject) {
        if let emailAddress = emailTextField.text {
            if let password = passwordTextField.text {
                let newUser = PFUser()
                newUser.email = emailAddress
                newUser.password = password
                newUser.username = emailAddress
                newUser.signUpInBackgroundWithBlock({ (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        print(error)
                    } else {
                        print("hooray!")
                        let newChildVC = self.storyboard?.instantiateViewControllerWithIdentifier("NewChildVC")
                        self.showViewController(newChildVC!, sender: newChildVC)
                    }
                })
            }
        } else {
            print("there was an error creating the account")
        }
        
        
        
    }
    

    @IBAction func didTapFacebook(sender: AnyObject) {
        let permissions = ["public_profile", "email", "user_friends"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) { (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and and logged in through FB!")
                } else {
                    print("User logged in through FB")
                }
            } else {
                print("Uh oh. The user cancelled the FB login.")
            }
        }
    }
    

}
