//
//  SignInViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/11/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInNavBar: UIImageView!
    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var signInDescription: UIImageView!
    @IBOutlet weak var inputParent: UIView!
    @IBOutlet weak var signInParent: UIView!
    @IBOutlet weak var signInLoader: UIActivityIndicatorView!
    
    let alertController = UIAlertController(title: "Email Required", message: "Please input your email address", preferredStyle: .Alert)
    let invalidLogin = UIAlertController(title: "Invalid Email or Password", message: "Please input a valid email and password", preferredStyle: .Alert)
    
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = signInParent.frame.origin.y
        buttonOffset = -120
        
        // This is telling the scroll view to call the view controller with the scroll view event methods.
        signInScrollView.delegate = self
        
        // Set frame size to be similar to the image height with an additional 100
        signInScrollView.contentSize = signInScrollView.frame.size
        signInScrollView.contentInset.bottom = 100
        
        
        // Listen to keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        // create a cancel action
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        invalidLogin.addAction(cancelAction)
        
    
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
        signInNavBar.transform = transform
        inputParent.transform = transform
        
        // Set the alpha properties of the views to transparent
        signInNavBar.alpha = 0
        inputParent.alpha = 0
    
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.inputParent.transform = CGAffineTransformIdentity
            self.signInNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.inputParent.alpha = 1
            self.signInNavBar.alpha = 1
        }
        
    }
    
    func scrollViewDidScroll(signInScrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        
        // If the scrollView has been scrolled down by 50px or more...
        if signInScrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    // Keyboard will show
    func keyboardWillShow(notification: NSNotification!) {
        // Move the button up above keyboard
        signInParent.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        signInScrollView.contentOffset.y = signInScrollView.contentInset.bottom
    }
    
    // The keyboard is about to be hidden...
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        signInParent.frame.origin.y = buttonInitialY
    }
    
    @IBAction func didTapBackground(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func signInPressed(sender: AnyObject) {
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            
            presentViewController(alertController, animated: true,completion: nil)
        
        } else {
            
            signInLoader.startAnimating()
        
            delay(2, closure: { () -> () in
                if self.emailTextField.text == "hello@jeremiespoken.com" && self.passwordTextField.text == "password" {
                    
                    self.signInLoader.stopAnimating()
                    self.performSegueWithIdentifier("TutorialViewcontrollerSegue", sender: self)
                    
                    
                } else {
                    
                    self.signInLoader.stopAnimating()
                    self.presentViewController(self.invalidLogin, animated: true,completion: nil)
                }
            })
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
