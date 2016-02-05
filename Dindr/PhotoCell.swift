//
//  PhotoCell.swift
//  Dindr
//
//  
//  Copyright © 2016. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
   
  
    
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
            }
        }
    }

    
    
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
        }
    }

    
}
