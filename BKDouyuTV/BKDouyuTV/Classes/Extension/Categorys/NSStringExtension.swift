//
//  NSStringExtension.swift
//  Baye
//
//  Created by dzb on 16/8/5.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func stringIsBoolValue() -> Bool {
        
        switch self {
        case "true" , "1":
            return true
        default:
            return false
        }
        
    }
    
    func getTextSize(font : UIFont , restrictWidth width : CGFloat) -> CGSize {
        
        let dict   = [NSFontAttributeName : font]
        let string = self as NSString
        let size   = string.boundingRectWithSize(CGSizeMake(width, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: dict, context: nil).size

        return size
        
    }
    
    
    
}
