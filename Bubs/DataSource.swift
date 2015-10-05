//
//  DataSource.swift
//  Bubs
//
//  Created by Matt Krueger on 10/2/15.
//  Copyright © 2015 Matt Krueger. All rights reserved.
//

import Foundation

class AppDataSource: NSObject {

    var bubsData = [String: AnyObject]()
    
    override init() {
        
        
        super.init()
    }
    
    func queryForData() -> Dictionary<String, AnyObject> {
        var relationships : [PFObject]
        
        let query = PFQuery(className: "childParentRelationships")
        query.whereKey("parent", equalTo: PFUser.currentUser()!)
        relationships = query.findObjects() as! [PFObject]

        let childRelation = relationships[0]
        bubsData["child"] = childRelation["child"]
        
        return bubsData
    }
    
    
    
    // create a function to call and refresh this query and the data stored in the dictionary
}
