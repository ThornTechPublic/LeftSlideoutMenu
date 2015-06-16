# Create a Left Slideout Menu with Swift

This is a sample project with a left slideout menu, and a two-tabbed application for the main body.  The majority of the setup is done in the Storyboard.

## Theory

Apps tend to have a top level container like a `Tab Bar Controller` that cannot be embedded into a View.  The approach here is to wrap the main body and the left menu each inside a `Container View`.  Now both of these elements can be arranged inside a wrapper `View Controller`.  

A `ScrollView` is used to open and close the menu by shifting the left menu on and off-screen.  

Since Storyboard changes aren't really portable across projects, here is a recipe on how to recreate this.

## Instructions

### Create project

Start with a `Tabbed Application`.  This is just to demonstrate that even a `Tab Bar Controller` can be used with slideout menus.

Uncheck the box `Use Size Classes` for now, to give yourself some elbow room.

### Containing View Controller

Drop a `View Controller` onto the Storyboard.  This is a container that will hold both the Menu and Tab Bar Controller.

Check the box for `Is Initial View Controller`.

Change the `Simulated Size` from `Fixed` to `Freeform`.  Set the `Width` to 568 so we can fit the menu and Tab Bar side-by-side.

Create a new Swift file and set this View Controller's class to ContainerVC.

```
import UIKit
class ContainerVC : UIViewController {
}
```

### ScrollView

Inside Container View Controller, drop in a `ScrollView` and add constraints in all directions.

Uncheck the box for `Scrolling Enabled`.  This is so that the menu doesn't interfere with horizontal gestures in the app itself.

Check the box for `Paging Enabled`.

Wire the IBOutlet to ContainerVC:

```
@IBOutlet weak var scrollView: UIScrollView!
```

### Left Container

The left container holds the menu, and is not quite the full width of the screen.  

Drag a `Container View` into the left side of the `ScrollView`.  

Hard-code the width to 260. 

Add constraints for top, left, and right to the containing `ScrollView`.

Add a constraint for `Equal height` with the ContainerVC's embedded `View`.  Note: don't constrain the height to the ScrollView.

Delete the embedded `View Controller` that came with the `Container View`.

Drop a new `Table View Controller` onto the Storyboard, and connect using an `embed` segue.

### Right Container

The right container holds the main body of your app, namely the `Tab Bar Controller`.  

Drag a second `Container View` into the right side of the `ScrollView`.

Add constraints to the containing `ScrollView` for top, right, and bottom.  Connect horizontally to the left `Container View` you created earlier.

Constraint both `Equal height` and `Equal width` to the ContainerVC's embedded `View`.  Note: do not constrain these to the ScrollView.

Again, delete the embedded View Controller that came free with the `Container View`.  Instead, create an `embed` segue to the `Tab Bar Controller`.

To create a little visual separation between the two containers, add a `Runtime Attribute` to the `Right Container`.  Add `layer.shadowOpacity` with a `number` of `0.8`.

### First and Second Tabs

Embed each tab inside a `Navigation Controller`.  

Drag a `Bar Button Item` into the top left corner of each `View Controller`.

Create an `IBAction` for each controller.  These will fire off a `NSNotification` to the great-grandfather ContainerVC to toggle the menu.

```
@IBAction func toggleMenu(sender: AnyObject) {
  NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
}
```

### ContainerVC

Most of the Storyboard configuration is done.  All that's left is to copy the code from [ContainerVC.swift](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/LeftSlideoutMenu/ContainerVC.swift).

The code accomplishes the following:

* Add a flag to track the menu open state
* Open and close the menu by changing the contentOffset-x
* Listen for the "toggleMenu" notification
* Implement the toggleMenu method by opening or closing based on the current state
