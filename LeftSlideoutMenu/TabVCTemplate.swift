//
//  TabVCTemplate.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class TabVCTemplate : UIViewController {
    
    // placeholder for the tab's index
    var selectedTab = 0
    
    override func viewDidLoad() {
        
        // Sent from LeftMenu
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "openPushWindow", name: "openPushWindow", object: nil)
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSNotificationCenter.defaultCenter().postNotificationName("closeMenuViaNotification", object: nil)
        view.endEditing(true)
    }
    
    func openPushWindow(){
        if tabBarController?.selectedIndex == selectedTab {
            performSegueWithIdentifier("openPushWindow", sender: nil)            
        }
    }
    
}
