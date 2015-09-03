import UIKit

class SecondViewController: TabVCTemplate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTab = 1
        // do stuff here
    }
    
    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleLeftMenu", object: nil)
    }

    @IBAction func toggleRightMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleRightMenu", object: nil)
    }
}

