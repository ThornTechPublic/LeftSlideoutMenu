import UIKit

class FirstViewController: TabVCTemplate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTab = 0
        // do stuff here
    }
    
    @IBAction func toggleMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
    }
    
}

