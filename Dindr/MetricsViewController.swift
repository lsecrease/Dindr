//
//  MetricsViewController.swift
//  Dindr
//
//  Created by lsecrease on 1/23/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Parse

class MetricsViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var containerDay: UIView!
    @IBOutlet weak var containerWeek: UIView!
    @IBOutlet weak var containerMonth: UIView!
    @IBOutlet weak var containerYear: UIView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
      
        if PFUser.currentUser() == nil {
            let loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("Login") as! LoginVC
            presentViewController(loginVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(PFUser.currentUser())
    
        //PFUser.logOut()

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func segmentControlAction(sender: AnyObject) {
        
        if(segmentControl.selectedSegmentIndex == 0)
        {
            print("Day Segment Selected");
            containerDay.hidden = false
            containerWeek.hidden = true
            containerMonth.hidden = true
            containerYear.hidden = true
//            favoritesVC?.queryFavAds()
//            hideMessageNavButtons()
        }
        else if(segmentControl.selectedSegmentIndex == 1)
        {
            print("Week Segment Selected");
            containerDay.hidden = true
           containerWeek.hidden = false
            containerMonth.hidden = true
            containerYear.hidden = true
//            showMessageNavButtons()
            
        }
        else if(segmentControl.selectedSegmentIndex == 2)
        {
            print("Month Segment Selected");
            containerDay.hidden = true
            containerWeek.hidden = true
            containerMonth.hidden = false
            containerYear.hidden = true
//            hideMessageNavButtons()
        }
        else if(segmentControl.selectedSegmentIndex == 3)
        {
            print("Year Segment Selected")
            containerDay.hidden = true
            containerWeek.hidden = true
            containerMonth.hidden = true
            containerYear.hidden = false
//            hideMessageNavButtons()
        }

        
        
        
    }
    

}



