//
//  RestaurantDataViewController.swift
//  Dindr
//
//  Created by lsecrease on 8/15/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import Foundation
import UIKit
import Photos

class RestaurantDataViewController: UIViewController, UIAlertViewDelegate,
    UINavigationControllerDelegate,
    UIImagePickerControllerDelegate {

   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var restImage1: UIImageView!
    @IBOutlet weak var restImage2: UIImageView!
    @IBOutlet weak var restImage3: UIImageView!
    @IBOutlet weak var restImage4: UIImageView!
    
    private var postImage: UIImage! //Used to Store restImage image
    
    @IBOutlet weak var numberOfDishesSwiped: UILabel!
    @IBOutlet weak var checkInTotal: UILabel!
    @IBOutlet weak var usersInRadius: UILabel!
    
    
    var swipeObj = PFObject(className: "")
    
    var baseArray:[DishModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(PFUser.currentUser())")
        // Do any additional setup after loading the view.
        
        //numberOfDishesSwiped.text = "\(swipeObj[])"
        
        let dish1 = DishModel(image: UIImage(named: "f1.jpg"))
        let dish2 = DishModel(image: UIImage(named: "f2.jpg"))
        let dish3 = DishModel(image: UIImage(named: "f4.jpg"))
        
        baseArray = [dish1, dish2, dish3, DishModel(image: UIImage(named: "f1")), DishModel(image: UIImage(named: "f1")), DishModel(image: UIImage(named: "f1"))]
        println("\(baseArray)")
      
        
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
    
    //Using ImagePickerSheet Controller
    @IBAction func pickFeaturedImageClicked(sender: UITapGestureRecognizer) {
        
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .NotDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                //self.pickFeaturedImageClicked(sender)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.pickFeaturedImageClicked(sender)
                })
            })
            return
        }
        //Do you want to Take a Photo or Video with the Camera
        if authorization == .Authorized {
            let controller = ImagePickerSheetController()
            controller.addAction(ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "ActionTitle"), secondaryTitle: NSLocalizedString("Use This One", comment: "ActionTitle"), handler: { (_) -> () in
                
                self.presentCamera()
                
                }, secondaryHandler: { (action, numberOfPhotos) -> () in
                    controller.getSelectedImagesWithCompletion({ (images) -> Void in
                        self.postImage = images[0]
                        self.restImage1.image = self.postImage
                    })
            }))
            
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"),  style: .Cancel))
            
            presentViewController(controller, animated: true, completion: nil)
            
        }
        
    }
    
    func presentCamera() {
        
    }
    
    
    //Using ImagePickerSheet Controller for 2nd Image
    @IBAction func pick2ndFeaturedImageClicked(sender: UITapGestureRecognizer) {
        
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .NotDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                //self.pickFeaturedImageClicked(sender)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.pickFeaturedImageClicked(sender)
                })
            })
            return
        }
        //Do you want to Take a Photo or Video with the Camera
        if authorization == .Authorized {
            let controller = ImagePickerSheetController()
            controller.addAction(ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "ActionTitle"), secondaryTitle: NSLocalizedString("Use This One", comment: "ActionTitle"), handler: { (_) -> () in
                
                self.presentCamera()
                
                }, secondaryHandler: { (action, numberOfPhotos) -> () in
                    controller.getSelectedImagesWithCompletion({ (images) -> Void in
                        self.postImage = images[0]
                        self.restImage2.image = self.postImage
                    })
            }))
            
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"),  style: .Cancel))
            
            presentViewController(controller, animated: true, completion: nil)
            
        }
        
    }
    
    //Using ImagePickerSheet Controller
    @IBAction func pick3rdFeaturedImageClicked(sender: UITapGestureRecognizer) {
        
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .NotDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                //self.pickFeaturedImageClicked(sender)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.pickFeaturedImageClicked(sender)
                })
            })
            return
        }
        //Do you want to Take a Photo or Video with the Camera
        if authorization == .Authorized {
            let controller = ImagePickerSheetController()
            controller.addAction(ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "ActionTitle"), secondaryTitle: NSLocalizedString("Use This One", comment: "ActionTitle"), handler: { (_) -> () in
                
                self.presentCamera()
                
                }, secondaryHandler: { (action, numberOfPhotos) -> () in
                    controller.getSelectedImagesWithCompletion({ (images) -> Void in
                        self.postImage = images[0]
                        self.restImage3.image = self.postImage
                    })
            }))
            
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"),  style: .Cancel))
            
            presentViewController(controller, animated: true, completion: nil)
            
        }
        
    }
    
    
    //Using ImagePickerSheet Controller
    @IBAction func pick4thFeaturedImageClicked(sender: UITapGestureRecognizer) {
        
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .NotDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                //self.pickFeaturedImageClicked(sender)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.pickFeaturedImageClicked(sender)
                })
            })
            return
        }
        //Do you want to Take a Photo or Video with the Camera
        if authorization == .Authorized {
            let controller = ImagePickerSheetController()
            controller.addAction(ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "ActionTitle"), secondaryTitle: NSLocalizedString("Use This One", comment: "ActionTitle"), handler: { (_) -> () in
                
                self.presentCamera()
                
                }, secondaryHandler: { (action, numberOfPhotos) -> () in
                    controller.getSelectedImagesWithCompletion({ (images) -> Void in
                        self.postImage = images[0]
                        self.restImage4.image = self.postImage
                    })
            }))
            
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"),  style: .Cancel))
            
            presentViewController(controller, animated: true, completion: nil)
            
        }
        
    }
    
    
    
   

    
    
//    // BUTTON FOR IMAGES
//    func buttImageTapped(sender: UIButton) {
//        var button = sender as UIButton
//        buttTAG = button.tag
//        println("\(buttTAG)")
//        println("\(button.tag)")
//       
//        var alert = UIAlertView(title: "Dindr",
//            message: "Add a Photo",
//            delegate: self,
//            cancelButtonTitle: "Cancel",
//            otherButtonTitles:
//            "Take a picture",
//            "Choose from Library"
//        )
//        alert.show()
//        
//    }
    
//    // AlertView delegate
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        
//        // OPEN DEVICE'S CAMERA
//        if alertView.buttonTitleAtIndex(buttonIndex) == "Take a picture" {
//            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
//                var imagePicker = UIImagePickerController()
//                imagePicker.delegate = self
//                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
//                imagePicker.allowsEditing = false
//                self.presentViewController(imagePicker, animated: true, completion: nil)
//            }
//            
//            
//            // PICK A PHOTO FROM LIBRARY
//        } else if alertView.buttonTitleAtIndex(buttonIndex) == "Choose from Library" {
//            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
//                var imagePicker = UIImagePickerController()
//                imagePicker.delegate = self
//                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
//                imagePicker.allowsEditing = false
//                self.presentViewController(imagePicker, animated: true, completion: nil)
//            }
//        }
//    }
    
    
    
//    // ImagePicker Delegate
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        
//        // Assign Images
//        switch buttTAG {
//        case 0: restImage1.image = image;   break
//        case 1: restImage2.image = image;   break
//        case 2: restImage3.image = image;   break
//        case 3: restImage4.image = image;   break
//        default: break
//        }
//        dismissViewControllerAnimated(true, completion: nil)
//    }


    @IBAction func editSpecialButtonTapped(sender: AnyObject) {
        
        println("Edit Specials Button Tapped!")
        self.performSegueWithIdentifier("showPerks", sender: self)
    }


  

}

extension RestaurantDataViewController : UICollectionViewDataSource
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let thisDish = baseArray[indexPath.item]
        
        let cellIdentifier = "Dish"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestCollectionViewCell
        
        cell.dishImage = thisDish.image
        
        return cell
    }
}

