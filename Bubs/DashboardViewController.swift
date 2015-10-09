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
    var dataSource: AppDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    convenience init(bubsData:Dictionary<String, AnyObject>) {
        self.init()
        self.dataSource = AppDataSource()
        self.dataSource?.queryForData()
        
        
        if bubsData.count > 0 {
            child = self.dataSource!.bubsData["child"] as? PFObject
        }

    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
