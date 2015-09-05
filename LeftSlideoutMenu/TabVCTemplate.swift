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
    
    // The Storyboard let's you set the Modal segue's Presentation to `Current Context`.
    // However, it doesn't expose the option we want, which is `Over Current Context`.
    // For iOS 8:
    // 1. Make sure the segue Presentation is set to `Default`
    // 2. Set the modalPresentationStyle to OverCurrentContext during prepareForSegue
    // Note: iOS 7 requires a different approach.
    //
    // see: http://stackoverflow.com/questions/26032472/presenting-semi-transparent-viewcontroller-that-works-both-in-ios7-and-ios8
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OpenModalMask" {
            let modalMask = segue.destinationViewController as! ModalMask
            modalMask.modalPresentationStyle = .OverCurrentContext
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func openPushWindow(){
        if tabBarController?.selectedIndex == selectedTab {
            performSegueWithIdentifier("openPushWindow", sender: nil)            
        }
    }
    
}
