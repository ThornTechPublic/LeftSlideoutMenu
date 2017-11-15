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
        NotificationCenter.default.addObserver(self, selector: #selector(TabVCTemplate.openPushWindow), name: NSNotification.Name(rawValue: "openPushWindow"), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeMenuViaNotification"), object: nil)
        view.endEditing(true)
    }
    
    @objc func openPushWindow(){
        if tabBarController?.selectedIndex == selectedTab {
            performSegue(withIdentifier: "openPushWindow", sender: nil)
        }
    }
    
}
