//
//  Menu.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 1/7/16.
//  Copyright (c) 2016 Thorn Technologies. All rights reserved.
//

import UIKit

enum MenuState {
    case Open
    case Closed
}

class Menu {
    static let sharedInstance = Menu()
    var state:MenuState = .Closed {
        didSet {
            if state == .Closed {
                UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Slide)
            }
        }
    }
}