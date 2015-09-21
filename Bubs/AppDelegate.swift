//
//  AppDelegate.swift
//  Bubs
//
//  Created by Matt Krueger on 9/20/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.setApplicationId("qijzIIdKeFPhzn60yM1CgxpXTyksdCqsT4cJtNcq", clientKey: "r2pcHl9AYSFq206dpUeHMNC7k80y4XYVLmSrvVaZ")
        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(launchOptions, block: nil)
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application,
            openURL: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }


}

