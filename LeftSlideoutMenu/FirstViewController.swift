import UIKit

class FirstViewController: TabVCTemplate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do stuff here
    }
    
    @IBAction func toggleMenu(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
    }
    
}

