//
//  RCMultipleImage.swift
//  RCMultipleImageDemo
//
//  Created by Robin.Chao on 11/14/15.
//  Copyright © 2015 Robin.Chao. All rights reserved.
//

import UIKit

enum RCMultipleImagePath {
    case RCMultipleImageCircle
    case RCMultipleImageSquare
}

var kRCPercentageSmallerImage: CGFloat = 80.0
var kRCVisibleSideImageWidthFactor: CGFloat = 3.0/5.0

public class RCMultipleImage : NSObject {
    
    private var frontImage: UIImage = UIImage()
    private var leftImage: UIImage = UIImage()
    private var rightImage: UIImage = UIImage()
    private var borderPath: RCMultipleImagePath = .RCMultipleImageSquare
    private var borderColor: UIColor = UIColor()
    private var borderWidth: CGFloat = 0.0
    
    
    private var _sizeFrontImage: CGSize = CGSizeZero
    private var _sizeSideImage: CGSize = CGSizeZero
    private var _totalSize: CGSize = CGSizeZero
    
    static func rc_MultipleImage(frontImageSize size: CGSize!, frontImage: UIImage!, leftImage: UIImage!, rightImage: UIImage!, borderPath: RCMultipleImagePath, borderolor: UIColor, borderWidth: CGFloat) -> UIImage {
      
        let multipleImage = RCMultipleImage.init(size: size, frontImage: frontImage, leftImage: leftImage, rightImage: rightImage, borderPath: borderPath, borderColor: borderolor, borderWidth: borderWidth)
        return multipleImage.drawImage()
    }
    
    override init() {
        super.init()
    }
    
    convenience init(size: CGSize, frontImage: UIImage, leftImage: UIImage, rightImage: UIImage, borderPath: RCMultipleImagePath, borderColor: UIColor, borderWidth: CGFloat) {
    
        self.init()
        
        let frameWidthSideImage = size.width * kRCPercentageSmallerImage / 100.0
        let frameWidthSideImageVisible = frameWidthSideImage * kRCVisibleSideImageWidthFactor
        
        self.frontImage = frontImage
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.borderPath = borderPath
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        
        self._sizeFrontImage = size
        self._sizeSideImage = CGSizeMake(frameWidthSideImage, frameWidthSideImage)
        self._totalSize = CGSizeMake(size.width + 2 * frameWidthSideImageVisible, size.height)
        
    }
    
    
    func drawImage() -> UIImage{
        //total size
        var rect = CGRectZero
        rect.size = _totalSize
        
        //Rect left image
        var rectLeftImage = CGRectZero
        rectLeftImage.origin.y = (_totalSize.height - _sizeSideImage.height) / 2.0
        rectLeftImage.size = _sizeSideImage
        
        //Rect right image
        var rectRightImage = CGRectZero
        rectRightImage.origin.x = _totalSize.width - _sizeSideImage.width
        rectRightImage.origin.y = (_totalSize.height - _sizeSideImage.height) / 2.0
        rectRightImage.size = _sizeSideImage
        
        //Rect front image
        var rectFrontImage = CGRectZero
        rectFrontImage.origin.x = (_totalSize.width - _sizeFrontImage.width) / 2.0
        rectFrontImage.size = _sizeFrontImage
        
        //Design the sides image
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        var ctx = UIGraphicsGetCurrentContext()
        
        switch borderPath {
        case .RCMultipleImageCircle:
            CGContextAddEllipseInRect(ctx, rectLeftImage)
            CGContextAddEllipseInRect(ctx, rectRightImage)
        case .RCMultipleImageSquare:
            CGContextAddRect(ctx, rectLeftImage)
            CGContextAddRect(ctx, rectRightImage)
        }
        
        CGContextClip(ctx)
        
        self.leftImage.drawInRect(rectLeftImage)
        self.rightImage.drawInRect(rectRightImage)
        
        CGContextSetStrokeColorWithColor(ctx, borderColor.CGColor)
        CGContextSetLineWidth(ctx, borderWidth)
        
        switch borderPath {
        case .RCMultipleImageCircle:
            CGContextStrokeEllipseInRect(ctx, rectLeftImage)
            CGContextStrokeEllipseInRect(ctx, rectRightImage)
        case .RCMultipleImageSquare:
            CGContextStrokeRect(ctx, rectLeftImage)
            CGContextStrokeRect(ctx, rectRightImage)
        }
        
        let imageSide = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Design the center  image
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        ctx = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(ctx, borderColor.CGColor)
        CGContextSetLineWidth(ctx, borderWidth)
        
        switch borderPath {
        case .RCMultipleImageCircle:
            CGContextAddEllipseInRect(ctx, rectFrontImage)
        case .RCMultipleImageSquare:
            CGContextAddRect(ctx, rectFrontImage)
        }
        
        CGContextClip(ctx)
        
        self.frontImage.drawInRect(rectFrontImage)
        
        switch borderPath {
        case .RCMultipleImageCircle:
            CGContextStrokeEllipseInRect(ctx, rectFrontImage)
        case .RCMultipleImageSquare:
            CGContextStrokeRect(ctx, rectFrontImage)
        }
        
        let imageFront = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Final merge
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        imageSide.drawInRect(rect)
        imageFront.drawInRect(rect)
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage
    }
    
}