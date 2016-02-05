//
//  Restaurant.swift
//  Dindr
//
//  
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Parse

public class Restaurant: PFObject, PFSubclassing
{
    
    // MARK: - Public API

            @NSManaged public var name: String!
            @NSManaged public var facebook: String!
            @NSManaged public var twitter: String!
            @NSManaged public var pinterest: String!
            @NSManaged public var instagram: String!
            @NSManaged public var address: String!
            @NSManaged public var phone: String!
    
    
    // MARK: - Convenience Init
    
    init(name: String, address: String, phone: String, facebook: String, twitter: String, pinterest: String, instagram: String) {
        super.init()
        self.name = name
        self.address = address
        self.phone = phone
        self.facebook = facebook
        self.twitter = twitter
        self.instagram = instagram
        self.pinterest = pinterest
    }

    
    override init() {
        super.init()
    }
    
    // MARK: - PFSubclassing
    
    override public class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    
    public static func parseClassName() -> String {
        return "Rest_User"
    }
    

}
