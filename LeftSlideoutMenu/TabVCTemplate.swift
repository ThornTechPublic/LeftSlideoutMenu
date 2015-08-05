//
//  TabVCTemplate.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class TabVCTemplate : UIViewController {
    
    override func viewDidLoad() {
        
        // Sent from LeftMenu
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "openPushWindow", name: "openPushWindow", object: nil)
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func openPushWindow(){
        performSegueWithIdentifier("openPushWindow", sender: nil)
    }
    
}
