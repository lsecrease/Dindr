//
//  TabBar.swift
//  Dindr
//
//  Created by lsecrease on 1/23/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

class TabBar: UITabBar {
    
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 80
        return sizeThatFits
    }
    
  
}
