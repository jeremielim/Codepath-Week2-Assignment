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
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets: [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var xOffsets: [CGFloat] = [-30, 75, -66, 10, -200, -15]
    var scales: [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations: [CGFloat] = [-10, -10, 10, 10, 10, -10]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view, typically from a nib.
        introScrollView.delegate = self
        
        introScrollView.contentSize = CGSize(width: 320, height: 1136)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Offset 0 -> 568
        // xoffset -30 -> 0
        // yoffest -285 -> 0
        
        let photos: [UIImageView] = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
        
        let offset = CGFloat(scrollView.contentOffset.y)
        
        for photo in 0...5 {
            movePhoto(offset, curXOffset: xOffsets[photo], curYOffset: yOffsets[photo], curScale: scales[photo], curRotation: rotations[photo], curTile: photos[photo])
        }
        
        

    }
    
    func movePhoto(offset: CGFloat, curXOffset: CGFloat, curYOffset: CGFloat, curScale: CGFloat, curRotation: CGFloat, curTile:UIImageView) {
        
        // Offset 0 -> 568
        // xoffset -30 -> 0
        // yoffest -285 -> 0
        
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: curXOffset, r2Max: 0)
        
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: curYOffset, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: curScale, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: curRotation, r2Max: 0)
        
        curTile.transform = CGAffineTransformMakeTranslation(tx, ty)
        curTile.transform = CGAffineTransformScale(curTile.transform, scale, scale)
        curTile.transform = CGAffineTransformRotate(curTile.transform, CGFloat(rotation) * CGFloat(M_PI) / 180.0)
    }
 


}

