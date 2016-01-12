//
//  LeftMenu.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class LeftMenu : UITableViewController {
    var isLoggedIn = false
}

// MARK: - UITableViewDataSource methods

extension LeftMenu {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return isLoggedIn ? 1 : 0
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Home"
        case 1:
            cell.textLabel?.text = "My Account"
        case 2:
            cell.textLabel?.text = isLoggedIn ? "Log Out" : "Log In"
        default:
            cell.textLabel?.text = " ... "
        }
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if Menu.sharedInstance.state == .Open {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
}