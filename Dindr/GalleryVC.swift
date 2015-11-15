//
//  GalleryVC.swift
//  Dindr
//
//  Created by lsecrease on 10/5/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit
import Parse


class GalleryVC: UIViewController, UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
UIScrollViewDelegate {
    
    /* Views */
    @IBOutlet var galleryCollView: UICollectionView!
    
    @IBOutlet var imagePreviewView: UIView!
    @IBOutlet var imgScrollView: UIScrollView!
    @IBOutlet var imgPrev: UIImageView!
    
    
    /* Variables */
    var galleryArray = NSMutableArray()
    
    var collViewCells: CGFloat = 3.0
    
    var hudView = UIView(frame: CGRectMake(0, 0, 80, 80))
    var indicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 80, 80))

    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePreviewView.frame = CGRectMake(0, 0, 0, 0)

        queryGallery()
        
        //println("\(galleryArray.count)")
        
       
        
      
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imgPrev
    }
    
    func queryGallery() {
        
        // ERROR ALERT VIEW
        let errorAlert = UIAlertView(title: "Dindr",
            message: "Something went wrong, try again later or check your internet connection",
            delegate: nil,
            cancelButtonTitle: "OK" )
        
        view.showHUD(view)
        galleryArray.removeAllObjects()
        
        let query = PFQuery(className: "Gallery")
        query.findObjectsInBackgroundWithBlock { (objects, error)-> Void in
            if error == nil {
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.galleryArray.addObject(object)
                    } }
                // Reload Data
                self.galleryCollView.reloadData()
                self.view.hideHUD()
                print("\(self.galleryArray.count)")
                
            } else {  errorAlert.show();  self.view.hideHUD()  }
        }
    }



    /* MARK: - COLLECTION VIEW DELEGATES ========================*/
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryArray.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryCell", forIndexPath: indexPath) as! GalleryCell
    
        var galleryClass = PFObject(className: "Gallery")
        galleryClass = galleryArray[indexPath.row] as! PFObject
        
        
        // Get image
        let imageFile = galleryClass["image"] as? PFFile
        imageFile?.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    cell.galImage.image = UIImage(data:imageData)
                    cell.galImage.layer.borderColor = UIColor.blackColor().CGColor
                    cell.galImage.layer.borderWidth = 1
                } } }
//
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.size.width / collViewCells, view.frame.size.width / collViewCells)
    }
    
    // IMAGE TAPPED
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var galleryClass = PFObject(className: "Gallery")
        galleryClass = galleryArray[indexPath.row] as! PFObject
        
        let imageFile = galleryClass["image"] as? PFFile
        imageFile?.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    self.imgPrev.image = UIImage(data:imageData)
                    self.showImagePrevView()
                } } }
    }
    

    
    
    // SHOW/HIDE PREVIEW IMAGE VIEW
    func showImagePrevView() {
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.imagePreviewView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
            }, completion: { (finished: Bool) in  })
    }
    func hideImagePrevView() {
        imgPrev.image = nil
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.imagePreviewView.frame = CGRectMake(0, 0, 0, 0)
            }, completion: { (finished: Bool) in  })
    }
    
    
    // TAP ON IMAGE TO CLOSE PREVIEW
    @IBAction func tapToClosePreview(sender: UITapGestureRecognizer) {
        hideImagePrevView()
    }


}

extension UIView {
    func showHUD(inView: UIView) {
        hudView.center = CGPointMake(inView.frame.size.width/2, inView.frame.size.height/2)
        hudView.backgroundColor = UIColor(red: 237.0/255.0, green: 85.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        hudView.alpha = 0.9
        hudView.layer.cornerRadius = hudView.bounds.size.width/2
        
        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        hudView.addSubview(indicatorView)
        inView.addSubview(hudView)
        indicatorView.startAnimating()
    }
    
    func hideHUD() {  hudView.removeFromSuperview()  }
}




