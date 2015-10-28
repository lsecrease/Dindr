//
//  SpecialsTableViewController.swift
//  Dindr
//
//  Created by lsecrease on 9/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class SpecialsTableViewController: UITableViewController {
    
    
    var paidMember: Bool = false
    var perksArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if paidMember == false {
        return 3
        } else {
            return perksArray.count
        }
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        <#code#>
//    }

 }
