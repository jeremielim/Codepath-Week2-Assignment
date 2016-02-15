//
//  PhotosViewController.swift
//  Codepath-Week2-Assignment
//
//  Created by Lim, Jeremie on 2/14/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photosScrollView: UIScrollView!

    let someText:String = "This is a from our Codepath assignment"
    let google:NSURL = NSURL(string:"http://codepath.com/")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photosScrollView.contentSize = CGSize(width: 960, height: 568)
        
        photosScrollView.delegate = self
        
        let openedPhoto: Bool = true
        
        NSUserDefaults.standardUserDefaults().setBool(openedPhoto, forKey: "opened_photo")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sharePressed(sender: AnyObject) {
        
        let sharedPhoto: Bool = true
        
        NSUserDefaults.standardUserDefaults().setBool(sharedPhoto, forKey: "shared_photo")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let activityViewController = UIActivityViewController(
            activityItems: [someText, google],
            applicationActivities: nil)
        
        presentViewController(activityViewController,
            animated: true,
            completion: nil)
    }
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let swipedPhoto: Bool = true
        
        NSUserDefaults.standardUserDefaults().setBool(swipedPhoto, forKey: "swiped_photo")
        NSUserDefaults.standardUserDefaults().synchronize()
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
