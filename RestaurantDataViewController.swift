//
//  RestaurantDataViewController.swift
//  Dindr
//
//  Created by lsecrease on 8/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class RestaurantDataViewController: UIViewController, UIAlertViewDelegate,
    UINavigationControllerDelegate,
UIImagePickerControllerDelegate {

    @IBOutlet weak var restImage1: UIImageView!
    @IBOutlet weak var restImage2: UIImageView!
    @IBOutlet weak var restImage3: UIImageView!
    @IBOutlet weak var restImage4: UIImageView!
    
    @IBOutlet var buttonImages: [UIButton]!
    var buttTAG = Int()
    
    @IBOutlet weak var numberOfDishesSwiped: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Setup buttons to load Ad images
        for button in buttonImages {
            button.addTarget(self, action: "buttImageTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }

    //Check to see if User is logged in; If not, head over to login
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (PFUser.currentUser() == nil) {
            self.performSegueWithIdentifier("login", sender: self)
        } else if (PFUser.currentUser() != nil) {
            self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantData")
        }
    }
    
    
    // BUTTON FOR IMAGES
    func buttImageTapped(sender: UIButton) {
        var button = sender as UIButton
        buttTAG = button.tag
        
        var alert = UIAlertView(title: "Dindr",
            message: "Add a Photo",
            delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles:
            "Take a picture",
            "Choose from Library"
        )
        alert.show()
        
    }
    
    // AlertView delegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        // OPEN DEVICE'S CAMERA
        if alertView.buttonTitleAtIndex(buttonIndex) == "Take a picture" {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                var imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
            
            
            // PICK A PHOTO FROM LIBRARY
        } else if alertView.buttonTitleAtIndex(buttonIndex) == "Choose from Library" {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                var imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // ImagePicker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        // Assign Images
        switch buttTAG {
        case 0: restImage1.image = image;   break
        case 1: restImage2.image = image;   break
        case 2: restImage3.image = image;   break
        case 3: restImage4.image = image;   break
        default: break
        }
        dismissViewControllerAnimated(true, completion: nil)
    }




  

}
