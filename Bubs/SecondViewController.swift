//
//  SecondViewController.swift
//  Bubs
//
//  Created by Matt Krueger on 9/20/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var child: String?
    @IBOutlet weak var heroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        child = AppDataSource().bubsData["childName"] as? String
        
        heroLabel.text = child!
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

