# Create a Left Slideout Menu with Swift

This is a sample project with a left slideout menu, and a two-tabbed application for the main body.  The majority of the setup is done in the Storyboard.

This repo is tied to [this blog post](http://www.thorntech.com/2015/06/want-to-implement-a-slideout-menu-in-your-swift-app-heres-how/).

![animated gif demo](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/leftMenuVid.gif)

## Use Case

* You lean heavily on Storyboard use, and value separation of UI code over portability.
* You're using Swift, and want to avoid bridging Objective-C modules when possible

## Theory

Apps tend to have a top level container like a `Tab Bar Controller` that cannot be embedded inside a View.  The approach here is to wrap the main body and the left menu each inside a `Container View`.  Now both of these elements can be arranged inside a wrapper `View Controller`.  

![storyboard image](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/containerStoryboard.png)

A `ScrollView` is used to simulate opening and closing the menu by shifting the left menu on/off-screen.  

Since Storyboard changes aren't really portable across projects, here is a recipe on how to recreate this.

## Instructions

### Create project

Start with a `Tabbed Application`.  This is just to demonstrate that even a `Tab Bar Controller` can be used with slideout menus.

Uncheck the box `Use Size Classes` for now, simply for the sake of screen real estate.

![tabbed application](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/tabbedApplicationIcon.png)

### Containing View Controller

Drop a `View Controller` onto the Storyboard.  This is your entry point into the app, and acts as a big wrapper.  Think of a [Laundry Sorting Cart](http://www.amazon.com/DecoBros-Heavy-Duty-3-Bag-Laundry-Sorter/dp/B00HLSTYNS/) that can hold baskets for lights and darks.  Or in this case, a Menu and Tab Bar Controller.

Check the box for `Is Initial View Controller`.

Change the `Simulated Size` from `Fixed` to `Freeform`.  Set the `Width` to 568 so we can fit the menu and Tab Bar side-by-side.

![use freeform size](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/freeform.png)

Create a new Swift file and set this View Controller's class to ContainerVC.

```
import UIKit
class ContainerVC : UIViewController {
}
```

### ScrollView

Inside Container View Controller, drop in a `ScrollView` and add constraints in all directions.

Check the box for `Scrolling Enabled`.  This allows you to pan the screen to slide the menu.  You might need to disable this if your app uses horizontally scrolling elements.

Check the box for `Paging Enabled`.  This snaps the menu to either the open or closed state.

Uncheck the box for `Bounces`.  You don't really want to scroll past the right edge of the Tab Bar Controller.

![scrollview properties](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/scrollingEnabled.png)

Wire the IBOutlet to ContainerVC:

```
@IBOutlet weak var scrollView: UIScrollView!
```

### Left Container

The left container holds the menu, and is not quite the full width of the screen.  

Drag a `Container View` into the left side of the `ScrollView`.  

Add constraints for top, left, and right to the containing `ScrollView`.

Hard-code the width to 260. 

Add a constraint for `Equal height` with the ContainerVC's embedded `View`.  Note: don't constrain the height to the ScrollView.

![left container constraints](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/leftMenuConstraints.png)

Delete the embedded `View Controller` that came with the `Container View`.

Drop a new `Table View Controller` onto the Storyboard, and connect using an `embed` segue.

### Right Container

The right container holds the main body of your app, namely the `Tab Bar Controller`.  

Drag a second `Container View` into the right side of the `ScrollView`.

Add constraints to the containing `ScrollView` for top, right, and bottom.  Connect horizontally to the left `Container View` you created earlier.

Constraint both `Equal height` and `Equal width` to the ContainerVC's embedded `View`.  Note: do not constrain these to the ScrollView.

![right container constraints](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/rightConstraints.png)

Here's a short demo of setting the `Equal height` and `width` constraints to the `View`:

![animated gif of setting constraints](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/setConstraintsFromContainers.gif)

Again, delete the embedded View Controller that came free with the `Container View`.  Instead, create an `embed` segue to the `Tab Bar Controller`.

To create a little visual separation between the two containers, add a `Runtime Attribute` to the `Right Container`.  Add `layer.shadowOpacity` with a `number` of `0.8`.

![set runtime attributes](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/GitHubImages/runtimeAttributes.png)

### First and Second Tabs

Embed each tab inside a `Navigation Controller`.  Doing so gives you a free `Navigation Bar`.

Drag a `Bar Button Item` into the top left corner of each `Navigation Bar`.

Wire an `IBAction` to each controller.  These will fire off a `NSNotification` to the great-grandfather `ContainerVC` to toggle the menu.

```
@IBAction func toggleMenu(sender: AnyObject) {
  NSNotificationCenter.defaultCenter().postNotificationName("toggleMenu", object: nil)
}
```

### ContainerVC

Most of the Storyboard configuration is done.  All that's left is to copy the code from [ContainerVC.swift](https://github.com/ThornTechPublic/LeftSlideoutMenu/blob/master/LeftSlideoutMenu/ContainerVC.swift).

The code accomplishes the following:

* Listen for the "toggleMenu" notification
* Implement the toggleMenu method by opening or closing based on the current contentOffset.x
* Open and close the menu by changing the contentOffset-x

### That's it

Build and run, and hopefully you have a simple slideout left menu on which to build the rest of your app.

### Still confused?

The `ScrollView` is pretty confusing to begin with.  One common trick is to have a rigidly defined view on the inside.  In this case, the left and right container views are constrained to the device (View Controller's embedded `View`) width and height.  The `ScrollView` acts like a flexible wrapper.

Here's an excellent video tutorial on [Ray Wenderlich](http://www.raywenderlich.com/video-tutorials#swiftscrollview) that covers the `ScrollView`.  Note parts 13 and 14 cover the Slide-out-sidebar upon which the idea of using the ScrollView for a slideout menu is based upon.
