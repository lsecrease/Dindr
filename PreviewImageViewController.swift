//
//  PreviewImageViewController.swift
//  Dindr
//
//  Created by lsecrease on 10/20/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import UIKit

class PreviewImageViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    init(image: UIImage)
    {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        
        
        
}
}