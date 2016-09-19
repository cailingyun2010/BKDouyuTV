//
//  UIColorExtension.swift
//  Baye
//
//  Created by 董招兵 on 16/7/20.
//  Copyright © 2016年 Bayekeji. All rights reserved.
//

import Foundation
import UIKit

let baseColor = UIColor.colorWithHexString("F0F0F0")

// MARK: - 颜色拓展类
extension UIColor {
    
    class func RGBAColor(red : CGFloat ,green : CGFloat , blue : CGFloat,alpha : CGFloat) -> UIColor {
    
        let color = UIColor.init(red:(red/255.0), green: (green/255.0), blue: (blue/255.0), alpha: (alpha));
        
        return color;
    
    }
    
    class func RGBColor(red : CGFloat ,green : CGFloat , blue : CGFloat) -> UIColor {
        
        let color = self.RGBAColor(red, green: green, blue: blue, alpha: 1.0);
        
        return color;
        
    }
    
    class func RandomColor() -> UIColor {
        
        let red = arc4random_uniform(255)

        let green =  arc4random_uniform(255)
    
        let blue = arc4random_uniform(255)
        
        return UIColor.RGBColor(CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
        
    }
    
    class func colorWithHexString(hexString : String, alpha : CGFloat) -> UIColor {
        
        var cString:String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        let rString = cString.substringToIndex(cString.startIndex.advancedBy(2))
        let gString = cString.substringFromIndex(cString.startIndex.advancedBy(2)).substringToIndex(cString.startIndex.advancedBy(2))
        let bString = cString.substringFromIndex(cString.startIndex.advancedBy(4)).substringToIndex(cString.startIndex.advancedBy(2))
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        return UIColor(red: CGFloat(r) / 255.0, green:CGFloat(g) / 255.0, blue:CGFloat(b) / 255.0, alpha:CGFloat(alpha))
    }

    class  func colorWithHexString(hexString : String) -> UIColor {
        return colorWithHexString(hexString, alpha: 1.0)
    }
    
}