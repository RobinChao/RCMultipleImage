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
        
        
        let frontImage = UIImage(named: "s28311490")!
        let leftImage = UIImage(named: "s28322843")!
        let rightImage = UIImage(named: "s28337925")!
        
        let multipleImage = RCMultipleImage.rc_MultipleImage(frontImageSize: CGSizeMake(80, 80), frontImage: frontImage, leftImage: leftImage, rightImage: rightImage, borderPath: .RCMultipleImageSquare, borderolor: UIColor.clearColor(), borderWidth: 0)
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 80))
        imageView.image = multipleImage
        var center = self.view.center
        center.y -= 160
        imageView.center = center
        self.view.addSubview(imageView)
        
        
        
        
        
        let groupIconView = RCGroupPortraitView(frame: CGRectMake(0, 0, 100, 100))
        groupIconView.borderColor = UIColor.redColor()
        groupIconView.borderWidth = 2
        groupIconView.cornerRadius = 4
        var centerGroup = self.view.center
        centerGroup.y += 60
        groupIconView.center = centerGroup
        groupIconView.setImages([frontImage, leftImage, rightImage])
        self.view.addSubview(groupIconView)
        
        
        
        
        let groupURLIconView = RCGroupPortraitView(frame: CGRectMake(0, 0, 60, 60))
        groupURLIconView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        groupURLIconView.cornerRadius = 4
        var centerURLGroup = self.view.center
        centerURLGroup.y += 180
        groupURLIconView.center = centerURLGroup
        groupURLIconView.setImageURLs([ "http://img0.bdstatic.com/img/image/shouye/bizhi1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/mingxing1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/dongman1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/jianbihua1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/xiaoqingxin1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/qiche1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/fengjing1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/qiche1109.jpg",
                                        "http://img0.bdstatic.com/img/image/shouye/touxiang1109.jpg"
            ], defaultImage: frontImage)
        self.view.addSubview(groupURLIconView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

