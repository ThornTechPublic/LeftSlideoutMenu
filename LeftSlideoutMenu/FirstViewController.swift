import UIKit

class FirstViewController: TabVCTemplate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTab = 0
        // do stuff here
    }
    
    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleLeftMenu", object: nil)
    }
    
    @IBAction func toggleRightMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleRightMenu", object: nil)
    }
}

