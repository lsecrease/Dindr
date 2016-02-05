//
//  GalleryViewController.swift
//  Dindr
//
//  
//  Copyright © 2016. All rights reserved.
//

import UIKit
import PagingMenuController

class GalleryViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserGalleryViewController") as! UserGalleryCollectionViewController
        viewController.title = "User"
        
        let viewController2 = self.storyboard?.instantiateViewControllerWithIdentifier("RestGalleryViewController") as! RestaurantGalleryViewController
        viewController2.title = "Restaurant"
        
        let viewControllers = [viewController, viewController2]
        let options = PagingMenuOptions()
        options.menuItemMargin = 5
        options.menuHeight = 60
        options.menuDisplayMode = .SegmentedControl
        
        let pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)
    }

    


}
