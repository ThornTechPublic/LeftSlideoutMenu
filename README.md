# Create a Left Slideout Menu with Swift

This is a sample project that has a top-left button that toggles a left slideout menu.  The majority of the setup takes place in the Storyboard.

## How it's done

Storyboard changes aren't really portable across projects, so here is a recipe of how it's done.

### Create project

Start with a Tabbed Application.  This is just to demonstrate that even a Tab Bar Controller can be used with menus.

Uncheck the box `Use Size Classes` for now, to give yourself some elbow room.

### Container View Controller

Drop a `View Controller` onto the Storyboard.  This is a container that holds both the Menu and Tab Bar Controller.

Check the box for `Is Initial View Controller`.

Change the `Simulated Size` from `Fixed` to `Freeform`.  Set the `Width` to 568 to give us some elbow room.

Create a new Swift file and set the View Controller's class to ContainerVC.

```
import UIKit
class ContainerVC : UIViewController {
}
```

### ScrollView

Inside Container View Controller, drop in a `Scroll View` and wire the IBOutlet

```
@IBOutlet weak var scrollView: UIScrollView!
```

Uncheck the box for `Scrolling Enabled`.  

Check the box for `Paging Enabled`.
