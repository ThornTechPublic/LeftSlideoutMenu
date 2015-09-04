//
//  ModalMask.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 9/3/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class ModalMask : UIViewController {
    
    @IBAction func tappedModalMask(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
        dismissViewControllerAnimated(false, completion: nil)
    }
}
