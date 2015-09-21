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
    
    var logInViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presentLogInView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func presentLogInView() {
        if (PFUser.currentUser() == nil) {
            self.logInViewController.fields = PFLogInFields.Facebook
            
            let logInLogoTitle = UILabel()
            logInLogoTitle.text = "Bubs"
            
            self.logInViewController.logInView?.logo = logInLogoTitle
            
            self.logInViewController.delegate = self
            
            let signupLogoTitle = UILabel()
            signupLogoTitle.text = "Bubs"
            
            self.signUpViewController.signUpView?.logo = signupLogoTitle
            
            self.signUpViewController.delegate = self
            
            self.logInViewController.signUpController = self.signUpViewController
            
            self.presentViewController(logInViewController, animated: true, completion: nil)
        } else {
            print("Current user already signed in")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    // MARK: Parse Login
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("Failed to login")
    }
    
    // MARK: Parse Signup
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Failed to sign up")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        print("User dismissed signup")
    }
    
    // MARK: Logout

    @IBAction func logout(sender: AnyObject) {
        PFUser.logOut()
        self.presentLogInView()
    }
}

