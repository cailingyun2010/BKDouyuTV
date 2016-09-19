//
//  BKStringExtension.swift
//  Baye
//
//  Created by dzb on 16/8/16.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

extension String {
    
     public var doubleValue: Double {

        let str = self as NSString
        return str.doubleValue
     }

    public var intValue : Int {

        let str = self as NSString
        return str.integerValue
    }
    
    public var floatValue : Float {
        
        let str = self as NSString
        return str.floatValue
        
    }
    
    
    
}