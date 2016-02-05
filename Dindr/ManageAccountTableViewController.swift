//
//  ManageAccountTableViewController.swift
//  Dindr
//
//  1/18/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Auk
import Eureka
import Spring
import Parse

class ManageAccountTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var facebookTxt: UITextField!
    @IBOutlet weak var instagramTxt: UITextField!
    @IBOutlet weak var twitterTxt: UITextField!
    @IBOutlet weak var PinterestTxt: UITextField!
    
    @IBOutlet weak var facebookButton: DesignableButton!
    @IBOutlet weak var instagramButton: DesignableButton!
    @IBOutlet weak var twitterButton: DesignableButton!
    @IBOutlet weak var pinterestButton: DesignableButton!
    // MARK: - Public API
    var restaurant: Restaurant!
    
    // MARK: - Data Source
    var restArray = NSMutableArray()
    var restClass = PFObject(className: "Rest_User")


    
    // MARK: -  View Controller Life Cycle
    //Hides the Navigation Bar
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        fetchRest()
        
       
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Show local image
        if let image = UIImage(named: "torchy.jpg") {
            scrollView.auk.show(image: image)
        }
        
        if let image = UIImage(named: "torchy2.jpg") {
            scrollView.auk.show(image: image)
        }
        if let image = UIImage(named: "torchy3.jpg") {
            scrollView.auk.show(image: image)
        }
        if let image = UIImage(named: "torchy4.jpg") {
            scrollView.auk.show(image: image)
        }
        
        scrollView.auk.startAutoScroll(delaySeconds: 3)
        
         //updateUI()
        

    }
    
    func fetchRest() {
        restArray.removeAllObjects()
        
        let currentUser = User.currentUser()!
        let restIds = currentUser.restIds
        print(restIds)
        let restQuery = PFQuery(className: Restaurant.parseClassName())
        restQuery.whereKey("objectId", containedIn: restIds)
        print(restIds)
        restQuery.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if error == nil {
                if let restObjects = objects as? [PFObject]! {
                    //self.restaurant.removeAll()
                    for restObject in restObjects {
                        self.restArray.addObject(restObject)
                        //let rest = restObject as! Restaurant
                       
                    }
                    
                    self.showRestDetails()
                }
            } else {
                print("\(error!.localizedDescription)", terminator: "")
            }
        })

    }
    
    func showRestDetails() {
        
        restClass = restArray[0] as! PFObject
        
        self.title = "\(restClass["name"]!)"
        
        if restClass["address"] != nil {
            address.text = "\(restClass["address"]!)"
        } else { address.text = "" }
        
        if restClass["phone"] != nil {
            phone.text = "\(restClass["phone"]!)"
        } else { phone.text = "" }
        
        if restClass["facebook_url"] != nil {
            facebookTxt.text = "\(restClass["facebook_url"]!)"
        } else { facebookTxt.text = "" }
        
        if restClass["twitter_url"] != nil {
            twitterTxt.text = "\(restClass["twitter_url"]!)"
        } else { twitterTxt.text = "" }
        
        if restClass["instagram_url"] != nil {
            instagramTxt.text = "\(restClass["instagram_url"]!)"
        } else { instagramTxt.text = "" }
        
        if restClass["pinterest_url"] != nil {
            PinterestTxt.text = "\(restClass["pinterest_url"]!)"
        } else { PinterestTxt.text = "" }
        
        //facebookTxt?.text! = restaurant.facebook
        //twitterTxt?.text! = restaurant.twitter
        //PinterestTxt?.text! = restaurant.pinterest
        //instagramTxt?.text! = restaurant.instagram
        //address.text = restaurant.address
        //phone.text = restaurant.phone
        
        
    }
    
    @IBAction func facebookSave(sender: AnyObject) {
        restClass["facebook_url"] = facebookTxt.text
        
        restClass.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                self.facebookTxt.resignFirstResponder()
            } else {
                print("\(error!.localizedDescription)", terminator: "")
            }
        }
    }
    @IBAction func instagramSave(sender: AnyObject) {
        restClass["instagram_url"] = instagramTxt.text
        
        restClass.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                self.instagramTxt.resignFirstResponder()
            } else {
                print("\(error!.localizedDescription)", terminator: "")
            }
        }
    }
    @IBAction func twitterSave(sender: AnyObject) {
        restClass["twitter_url"] = twitterTxt.text
        
        restClass.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                self.twitterTxt.resignFirstResponder()
            } else {
                print("\(error!.localizedDescription)", terminator: "")
            }
        }
    }
    @IBAction func pinterestSave(sender: AnyObject) {
        restClass["pinterest_url"] = PinterestTxt.text
        
        restClass.saveInBackgroundWithBlock { (success, error) -> Void in
            if error == nil {
                self.PinterestTxt.resignFirstResponder()
            } else {
                print("\(error!.localizedDescription)", terminator: "")
            }
        }
    }
    
//    private func navBarSetup(hidden:Bool, trans:Bool){
//        self.navigationController!.navigationBarHidden = hidden
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.translucent = trans
//    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
    @IBAction func tapToDismissKeyb(sender: UITapGestureRecognizer) {
        dismissKeyb()
    }
    
    func dismissKeyb() {
        facebookTxt.resignFirstResponder()
        instagramTxt.resignFirstResponder()
        twitterTxt.resignFirstResponder()
        PinterestTxt.resignFirstResponder()
        
    }

   
    // MARK: - TEXTFIELD DELEGATE
    func textFieldShouldReturn(textField: UITextField) -> Bool {
     
        if textField == facebookTxt  {
           
                //facebookButton.enabled = true
            
        }
       
        
        
        
        return true
    }
    
   func textFieldDidBeginEditing(textField: UITextField) {
    
//    if textField == facebookTxt {
//        facebookButton.enabled = true
//    } else {
//        facebookButton.enabled = false
//    }
       if !facebookTxt.text!.isEmpty {
        facebookButton.enabled = true
        
       } else {
        facebookButton.enabled = false
        facebookButton.hidden = true
        }
}
}


