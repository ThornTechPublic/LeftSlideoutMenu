import UIKit

class FirstViewController: TabVCTemplate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTab = 0
        // do stuff here
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchTabs:", name: "switchTabs", object: nil)

    }
    
    func switchTabs(notification: NSNotification){
        if let payload = notification.userInfo {
            if let tabIndex = payload["tabIndex"] as? Int {
                tabBarController?.selectedIndex = tabIndex
                navigationController?.popToRootViewControllerAnimated(true)
            }
        }
    }
    
    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
}

