//
//  ViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/8/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
   
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introTile1: UIImageView!
    
    var introTile1InitY: CGFloat!
    var introTile1Offset: CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        introTile1InitY = introTile1.frame.origin.y
        introTile1Offset = -400
        
        introTile1.frame.origin.y = introTile1InitY + introTile1Offset
        
        // Do any additional setup after loading the view, typically from a nib.
        introScrollView.delegate = self
        
        introScrollView.contentSize = CGSize(width: 320, height: 1136)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        print(introScrollView.contentOffset.y)

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }



}

