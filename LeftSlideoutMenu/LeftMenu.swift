//
//  LeftMenu.swift
//  LeftSlideoutMenu
//
//  Created by Robert Chen on 8/5/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class LeftMenu : UITableViewController {
    
    let menuOptions = ["Open Modal", "Open Push"]
    
}

// MARK: - UITableViewDelegate methods

extension LeftMenu {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            // ContainerVC.swift listens for this
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "openModalWindow"), object: nil)
        case 1:
            // Both FirstViewController and SecondViewController listen for this
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "openPushWindow"), object: nil)
        default:
            print("indexPath.row:: \(indexPath.row)")
        }
        
        // also close the menu
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeMenuViaNotification"), object: nil)
        
    }
    
}

// MARK: - UITableViewDataSource methods

extension LeftMenu {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = menuOptions[indexPath.row]
        return cell
    }
    
}
