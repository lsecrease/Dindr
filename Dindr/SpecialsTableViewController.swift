//
//  SpecialsTableViewController.swift
//  Dindr
//
//  Created by lsecrease on 9/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class SpecialsTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var perksTableView: UITableView!
    
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
    
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    
    let cellIdentifier = "PerkCell"
    let cell = perksTableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpecialsTableViewCell
    cell.perkImage.image = UIImage(named: "resticon")
    cell.perkDescription.text = "This is the description of the perk."
    
    //cell.kluster = self.klusters[indexPath.item]
    //cell.joinKlusterButton.tag = indexPath.row
  
    
    return cell
  }
    
    //Editing the Cell
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction = UITableViewRowAction(style: .Normal, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            
            let firstActivityItem = self.perksArray[indexPath.row]
            
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        })
        
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction]
    }

    
    
    @IBAction func addPerkClicked(sender: UIBarButtonItem) {
    }

 }
