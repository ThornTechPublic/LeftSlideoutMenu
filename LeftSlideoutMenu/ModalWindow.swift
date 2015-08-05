//
//  ModalWindow.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class ModalWindow : UIViewController {
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
