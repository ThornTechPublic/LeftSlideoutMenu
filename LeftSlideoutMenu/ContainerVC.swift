import UIKit

class ContainerVC : UIViewController {
    
    // This value matches the left menu's width in the Storyboard
    let leftMenuWidth:CGFloat = 260
    
    // Need a handle to the scrollView to open and close the menu
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        // Initially close menu programmatically.  This needs to be done on the main thread initially in order to work.
        dispatch_async(dispatch_get_main_queue()) {
            self.closeMenu(animated: false)
        }
                
        // Tab bar controller's child pages have a top-left button toggles the menu
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "toggleMenu", name: "toggleMenu", object: nil)
        
        // LeftMenu sends openModalWindow
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "openModalWindow", name: "openModalWindow", object: nil)

    }
    
    // Cleanup notifications added in viewDidLoad
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func openModalWindow(){
        performSegueWithIdentifier("openModalWindow", sender: nil)
    }
    
    func toggleMenu(){
        scrollView.contentOffset.x == 0  ? openMenu() : closeMenu()
    }
    
    // Use scrollview content offset-x to slide the menu.
    func closeMenu(animated:Bool = true){
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: animated)
    }
    
    // Open is the natural state of the menu because of how the storyboard is setup.
    func openMenu(){
        println("opening menu")
        scrollView.setContentOffset(CGPoint(x: -leftMenuWidth, y: 0), animated: true)
    }
    
}
