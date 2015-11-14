//
//  ViewController.swift
//  RCMultipleImageDemo
//
//  Created by Robin.Chao on 11/14/15.
//  Copyright © 2015 Robin.Chao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let frontImage = UIImage(named: "face1")
        let leftImage = UIImage(named: "face2")
        let rightImage = UIImage(named: "face3")
        
        let multipleImage = RCMultipleImage.rc_MultipleImage(frontImageSize: CGSizeMake(80, 80), frontImage: frontImage!, leftImage: leftImage!, rightImage: rightImage!, borderPath: .RCMultipleImageSquare, borderolor: UIColor.redColor(), borderWidth: 3)
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 200, 100))
        imageView.image = multipleImage
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

