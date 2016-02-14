//
//  TutorialViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/13/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialViewController: UIScrollView!
    @IBOutlet weak var welcomePageControl: UIPageControl!
    @IBOutlet weak var tourParentView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tutorialViewController.contentSize = CGSize(width: 1280, height: 568)
        
        // Listen to scroll events
        tutorialViewController.delegate = self
        
        // Hide tour button parent
        tourParentView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let currentPage: Int = Int(round(tutorialViewController.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        welcomePageControl.currentPage = currentPage
        
        if currentPage == 3 {
            UIView.animateWithDuration(0.3) {
                self.welcomePageControl.hidden = true
                self.tourParentView.alpha = 1
            }
        }
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
