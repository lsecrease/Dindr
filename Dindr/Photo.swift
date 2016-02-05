//
//  Photo.swift
//  
//
//
//  Copyright (c) 2015 . All rights reserved.
//

import UIKit

class Photo {
  
  class func allPhotos() -> [Photo] {
    var photos = [Photo]()
    if let URL = NSBundle.mainBundle().URLForResource("Photos", withExtension: "plist") {
      if let photosFromPlist = NSArray(contentsOfURL: URL) {
        for dictionary in photosFromPlist {
          let photo = Photo(dictionary: dictionary as! NSDictionary)
          photos.append(photo)
        }
      }
    }
    return photos
  }
  
 
  var image: UIImage
  
  init(image: UIImage) {
 
    self.image = image
  }
  
  convenience init(dictionary: NSDictionary) {
 
    let photo = dictionary["Photo"] as? String
    let image = UIImage(named: photo!)?.decompressedImage
    self.init(image: image!)
  }
  

  
}
