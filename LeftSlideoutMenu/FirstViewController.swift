//
//  FirstViewController.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 6/15/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

