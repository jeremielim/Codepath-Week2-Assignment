//
//  GetStartedViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/14/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    @IBOutlet weak var viewPhotoButton: UIButton!
    
    @IBOutlet weak var swipePhotoButton: UIButton!
    
    @IBOutlet weak var sharePhotoButton: UIButton!
  
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let didOpenPhoto = NSUserDefaults.standardUserDefaults().boolForKey("opened_photo")
        let didShare =
        NSUserDefaults.standardUserDefaults().boolForKey("shared_photo")
        let didSwipe =
        NSUserDefaults.standardUserDefaults().boolForKey("swiped_photo")
    
        if didOpenPhoto == true {
            viewPhotoButton.selected = true
        }
        
        if didShare == true {
            sharePhotoButton.selected = true
        }
        
        if didSwipe == true {
            swipePhotoButton.selected = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressClose(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)    
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
