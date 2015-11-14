//
//  RCGroupPortraitView.swift
//  RCMultipleImageDemo
//
//  Created by Robin.Chao on 11/14/15.
//  Copyright © 2015 Robin.Chao. All rights reserved.
//

import UIKit
import Nuke

func randomColor() -> UIColor {
    let hue: CGFloat = ( CGFloat(arc4random()) % 256 / 256)
    let saturation: CGFloat = ( CGFloat(arc4random()) % 128 / 256) + 0.5
    let brighness: CGFloat = ( CGFloat(arc4random()) % 128 / 256) + 0.5
    
    return UIColor(hue: hue, saturation: saturation, brightness: brighness, alpha: 1.0)
}


@IBDesignable class RCGroupPortraitView: UIView {
    
    private var imageViews = [UIImageView]()
    
    var selfWidth: CGFloat {
        return self.frame.width
    }
    var selfHeight: CGFloat {
        return self.frame.height
    }
    
    var imageIconWidth: CGFloat {
        if self.imageCount == 1 {
            return selfWidth
        } else if self.imageCount >= 2 && self.imageCount <= 4 {
            return ((selfWidth - (marginSpace * 3)) / 2)
        } else {
            return ((selfWidth - (marginSpace * 4)) / 3)
        }
    }
    
    var imageIconHeight: CGFloat {
        if self.imageCount == 1 {
            return selfHeight
        } else if self.imageCount >= 2 && self.imageCount <= 4 {
            return ((selfHeight - (marginSpace * 3)) / 2)
        } else {
            return ((selfHeight - (marginSpace * 4)) / 3)
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    
    @IBInspectable var marginSpace: CGFloat = 2 {
        didSet {
            configureImageView()
        }
    }
    
    @IBInspectable var imageCount: Int = 0 {
        didSet {
            configureImageView()
        }
    }
    
    private func configureImageView() {
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        
        imageViews.removeAll(keepCapacity: false)
        
        if imageCount <= 0 {
            print("image count error")
        } else if imageCount == 1 {
            let imageView1 = UIImageView(frame: CGRectMake(0, 0, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
        }else if imageCount == 2{
            
            let imageView1 = UIImageView(frame: CGRectMake(marginSpace, (selfHeight - imageIconHeight)/2, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, (selfHeight - imageIconHeight)/2, imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
        }else if imageCount == 3{
            
            let imageView1 = UIImageView(frame: CGRectMake((selfWidth - imageIconWidth)/2, marginSpace, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(marginSpace, imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(imageIconWidth + (marginSpace*2), imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
        }else if imageCount == 4{
            
            let imageView1 = UIImageView(frame: CGRectMake(marginSpace, marginSpace, imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(imageIconWidth + (marginSpace*2), marginSpace, imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(marginSpace, imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            let imageView4 = UIImageView(frame: CGRectMake(imageIconWidth + (marginSpace*2), imageIconHeight + (marginSpace*2), imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
        }else if imageCount == 5{
            
            let imageView1 = UIImageView(frame: CGRectMake((selfWidth - (imageIconWidth * 2 + marginSpace))/2, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake((selfWidth - (imageIconWidth * 2 + marginSpace))/2 + imageIconWidth + marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace, imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            let imageView4 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            let imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
        }else if imageCount == 6{
            
            let imageView1 = UIImageView(frame: CGRectMake(marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, (selfHeight - (imageIconHeight * 2 + marginSpace))/2 , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            let imageView4 = UIImageView(frame: CGRectMake(marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace, imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            let imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace ,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            let imageView6 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace,(selfHeight - (imageIconHeight * 2 + marginSpace))/2 + imageIconHeight + marginSpace , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
        }else if imageCount == 7{
            
            let imageView1 = UIImageView(frame: CGRectMake((selfWidth - imageIconWidth)/2, marginSpace , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            let imageView4 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            let imageView5 = UIImageView(frame: CGRectMake(marginSpace,marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            let imageView6 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
            let imageView7 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView7.backgroundColor = randomColor()
            imageView7.tag = 6
            self.addSubview(imageView7)
            imageViews.append(imageView7)
            
        }else if imageCount == 8{
            let imageView1 = UIImageView(frame: CGRectMake(marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            let imageView4 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            let imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            let imageView6 = UIImageView(frame: CGRectMake(marginSpace,marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
            let imageView7 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView7.backgroundColor = randomColor()
            imageView7.tag = 6
            self.addSubview(imageView7)
            imageViews.append(imageView7)
            
            let imageView8 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView8.backgroundColor = randomColor()
            imageView8.tag = 7
            self.addSubview(imageView8)
            imageViews.append(imageView8)
            
        }else if imageCount >= 9{
            
            let imageView1 = UIImageView(frame: CGRectMake(marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView1.backgroundColor = randomColor()
            imageView1.tag = 0
            self.addSubview(imageView1)
            imageViews.append(imageView1)
            
            let imageView2 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView2.backgroundColor = randomColor()
            imageView2.tag = 1
            self.addSubview(imageView2)
            imageViews.append(imageView2)
            
            let imageView3 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace , imageIconWidth, imageIconHeight))
            imageView3.backgroundColor = randomColor()
            imageView3.tag = 2
            self.addSubview(imageView3)
            imageViews.append(imageView3)
            
            let imageView4 = UIImageView(frame: CGRectMake(marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView4.backgroundColor = randomColor()
            imageView4.tag = 3
            self.addSubview(imageView4)
            imageViews.append(imageView4)
            
            let imageView5 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView5.backgroundColor = randomColor()
            imageView5.tag = 4
            self.addSubview(imageView5)
            imageViews.append(imageView5)
            
            let imageView6 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView6.backgroundColor = randomColor()
            imageView6.tag = 5
            self.addSubview(imageView6)
            imageViews.append(imageView6)
            
            let imageView7 = UIImageView(frame: CGRectMake(marginSpace,marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView7.backgroundColor = randomColor()
            imageView7.tag = 6
            self.addSubview(imageView7)
            imageViews.append(imageView7)
            
            let imageView8 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView8.backgroundColor = randomColor()
            imageView8.tag = 7
            self.addSubview(imageView8)
            imageViews.append(imageView8)
            
            let imageView9 = UIImageView(frame: CGRectMake(marginSpace + imageIconWidth + marginSpace + imageIconWidth + marginSpace, marginSpace + imageIconHeight + marginSpace + imageIconHeight + marginSpace  , imageIconWidth, imageIconHeight))
            imageView9.backgroundColor = randomColor()
            imageView9.tag = 8
            self.addSubview(imageView9)
            imageViews.append(imageView9)
        }
    }
    
    
    func setImages(images: [UIImage]) {
        self.imageCount = images.count
        
        for var i = 0; i < self.imageCount; i++ {
            imageViews[i].image = images[i]
        }
    }
    
    func setImageURLs(imageURLs: [String], defaultImage: UIImage) {
        self.imageCount = imageURLs.count
        for var i = 0; i < self.imageCount; i++ {
            imageViews[i].image = defaultImage
            
            let task = NSThread(target: self, selector: "downloadImage:", object: ["url" : imageURLs[i], "index" : i])
            task.start()
        }
    }
    
    func downloadImage(dict: [String : AnyObject]) {
        let index = dict["index"] as! Int
        let url = dict["url"] as! String
        
        let request = ImageRequest(URLRequest: NSURLRequest(URL: NSURL(string: url)!))
        
        Nuke.taskWithRequest(request) {
            self.imageViews[index].image = $0.image
            print(self.imageViews[index])
            }.resume()
    }
}
