import UIKit

class SecondViewController: TabVCTemplate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTab = 1
        // do stuff here
    }
    
    @IBAction func toggleMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
    }

}

