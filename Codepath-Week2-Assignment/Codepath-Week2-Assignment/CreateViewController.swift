//
//  CreateViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/13/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var formsParentView: UIView!
    @IBOutlet weak var formScrollView: UIScrollView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -210
        
        formScrollView.contentSize = CGSize(width: 320, height: 800)

        
        // Listen to scroll events
        formScrollView.delegate = self
        
        // Listen to keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        
        // Apply the transform properties of the views
        formsParentView.transform = transform
        
        // Set the alpha properties of the views to transparent
        formsParentView.alpha = 0
        
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.formsParentView.transform = CGAffineTransformIdentity

            // Set the alpha properties of the views to fully opaque
            self.formsParentView.alpha = 1
      
        }
        
    }
    
    func scrollViewDidScroll(signInScrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        
        // If the scrollView has been scrolled down by 50px or more...
        if formScrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    // Keyboard will show
    func keyboardWillShow(notification: NSNotification!) {
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        formScrollView.contentOffset.y = 100
    }
    
    // The keyboard is about to be hidden...
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    @IBAction func didPressCheckButton(sender: AnyObject) {
        
        if checkButton.selected == true {
            checkButton.selected = false
        } else {
            checkButton.selected = true
        }
    }

    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
