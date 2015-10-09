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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "queryForData", name: "setChildNotificationKey", object: nil)
        
        self.queryForData()
        
    }
    
    func queryForData() -> Dictionary<String, AnyObject>? {
        var relationships : [PFObject]
        
        if PFUser.currentUser() != nil {
            let query = PFQuery(className: "childParentRelationships")
            query.whereKey("parent", equalTo: PFUser.currentUser()!)
            relationships = query.findObjects() as! [PFObject]
            
            if relationships.count > 0 {
                let childRelation = relationships[0]
                bubsData["childObject"] = childRelation["child"]
                
                let childObject = bubsData["childObject"] as! PFObject
                let childID = childObject.objectId!
                
                let childQuery = PFQuery(className: "Children")
                let childName = childQuery.getObjectWithId(childID)!["name"]
                
                bubsData["childName"] = childName
            }
            
            
            
        }
        print(bubsData)
        return bubsData
    }
    
    
    
    // create a function to call and refresh this query and the data stored in the dictionary
}
