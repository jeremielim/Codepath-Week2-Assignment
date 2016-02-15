//
//  TimelineViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/13/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var timelineViewController: UIScrollView!
    @IBOutlet weak var learnMoreParent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineViewController.contentSize = CGSize(width: 230, height: 1564)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let didOpenPhoto = NSUserDefaults.standardUserDefaults().boolForKey("opened_photo")
        let didShare =
        NSUserDefaults.standardUserDefaults().boolForKey("shared_photo")
        let didSwipe =
        NSUserDefaults.standardUserDefaults().boolForKey("swiped_photo")
        
        if didOpenPhoto == true && didShare == true && didSwipe == true {
            learnMoreParent.alpha = 0
        }
        

    }

    @IBAction func didTapClose(sender: AnyObject) {
        learnMoreParent.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
