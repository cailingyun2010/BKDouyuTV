//
//  UIImageExtension.swift
//  Baye
//
//  Created by dzb on 16/7/23.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

let KProductPlaceholderImage = UIImage.init(named: "图片未加载")

extension UIImage {
    
    /**
     *  给图片进行等比例缩放 知道宽度 去计算等比例后的高度
     */
    class func getScaleImageFromSize(sourceSize size : CGSize, fromWidth fromW : CGFloat) -> CGSize {

        let width       = size.width
        var height      = size.height
        let heightIsBig = (width < height)
        let scale       = heightIsBig ? (width/height): (height / width)
        height          = heightIsBig ? CGFloat(fromW/scale) : CGFloat(fromW*scale)
        return CGSizeMake(fromW, height);

    }
    
    /**
     *  根据高度 自适应宽度
     *
     *  @param fromSize 图片的原始尺寸
     *  @param fromH    图片限定的高度
     *
     *  @return 返回一个等比例自适应后的size
     */
    class func getScaleImageFromSize(sourceSize size : CGSize, fromHeight fromH : CGFloat) -> CGSize {
        
        var width       = size.width
        let height      = size.height
        let heightIsBig = (width < height)
        let scale       = heightIsBig ? (width/height): (height / width)
        width           = heightIsBig ? CGFloat(fromH * scale) : CGFloat(fromH/scale)
        return CGSizeMake(width, fromH);

    }
    
    /**
     图片裁剪成圆形图片
     */
    func roundImage() -> UIImage {
    
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0);

        let ctx        = UIGraphicsGetCurrentContext();
        let rect       = CGRectMake(0, 0, self.size.width, self.size.height)
        CGContextAddEllipseInRect(ctx!, rect);
          CGContextClip(ctx!);
        self.drawInRect(rect)
        let cirleImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        return cirleImage!
    }
    
    /**
     等比例缩放图片 并居中显示图片
     */
    func getScaleImageToCenter(sourceImage : UIImage?,targetSize: CGSize) -> UIImage?{
        
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        UIGraphicsBeginImageContext(size);

        let centerX      = (self.size.width  -  targetSize.width) / 2.0

        let centerY      = (self.size.height  -  targetSize.height) / 2.0

        let pt           = CGPointMake(centerX, centerY)

        sourceImage?.drawInRect(CGRectMake(pt.x,pt.y, targetSize.width, targetSize.height))

        // 绘制改变大小的图片
        //        [img drawInRect:CGRectMake(0,0, size.width, size.height)];
        // 从当前context中创建一个改变大小后的图片
        let  scaledImage = UIGraphicsGetImageFromCurrentImageContext();

        // 使当前的context出堆栈
        UIGraphicsEndImageContext();

        //返回新的改变大小后的图片
        return scaledImage;
        
    }
    
    func getScaleImage(sourceImage : UIImage?,targetSize: CGSize) -> UIImage? {

        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        UIGraphicsBeginImageContext(size);

        sourceImage?.drawInRect(CGRectMake(0,0, targetSize.width, targetSize.height))
        // 绘制改变大小的图片
//        [img drawInRect:CGRectMake(0,0, size.width, size.height)];
        // 从当前context中创建一个改变大小后的图片
        let  scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        // 使当前的context出堆栈
        UIGraphicsEndImageContext();
        //返回新的改变大小后的图片
        return scaledImage;


    }
    
    
    class func imageWithColor(color: UIColor) -> UIImage
    {
        let rect:CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext()
        return image
        
    }
}

