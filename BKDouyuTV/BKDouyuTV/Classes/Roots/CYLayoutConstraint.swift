//
//  CYLayoutConstraint.swift
//  Baye
//
//  Created by 董招兵 on 16/7/20.
//  Copyright © 2016年 Bayekeji. All rights reserved.
//

import Foundation
import UIKit

/**
 传入一个约束值 获取不同屏幕下的约束
 */
func CYLayoutConstraintValue(value : CGFloat) -> CGFloat {
    return CYLayoutConstraint.shareInstance.getCurrentLayoutContraintValue(value);
}

/**
 获取一个自适应字体
 */
func CYLayoutConstraintFont(fontSize : CGFloat) -> UIFont {
    return CYLayoutConstraint.shareInstance.getLayoutContraintFont(fontSize);
}

/**
 获取一个自适应字体的大小
 */
func CYLayoutConstraintFontSize(fontSize : CGFloat) -> CGFloat {
    return CYLayoutConstraint.shareInstance.getLayoutConstraintFontSize(fontSize);
}

/**
 当前的设备型号
 
 - iPhone5s:  5s 包括 4s 5 5s 屏幕宽度320的设备
 - iPhone6s:  6s 包括6 6s 屏幕宽度为375的设备
 - iPhone6SP: 6plus 6s Plus 屏幕宽度为414的设备
 */
enum iOSDeviceType {
    case iPhone4s
    case iPhone5s
    case iPhone6s
    case iPhone6SP
}

/// autoLayout 约束辅助类
class CYLayoutConstraint: NSObject {
    
    var deviceType : iOSDeviceType?

    static var shareInstance : CYLayoutConstraint = {
        let layoutInstrance        = CYLayoutConstraint();
        layoutInstrance.deviceType = layoutInstrance.currenDeviceType();
        return layoutInstrance;
    }();
    
    /**
     获取当前设备的机型
     */
    func currenDeviceType() -> iOSDeviceType {
        
        switch KScreenWidth {
            
        case 320.0 :
            return .iPhone5s
        
        case 375.0 :
            return .iPhone6s
            
        default :
            
            return .iPhone6SP
            
        }
        
    }
    
    /**
     根据屏幕比例算出不同的约束值确定约束值
     
     - parameter value: 原始值
     
     - returns: 约束值
     */
    func getCurrentLayoutContraintValue(value : CGFloat) -> CGFloat {
        
        let iosDeviceType = self.deviceType!;
        
        switch iosDeviceType {
            
        case .iPhone5s :
            
            return CGFloat(value * 0.85333);
            
        case .iPhone6s :
            
            return value;
            
        default:
            
            return CGFloat(value * 1.104);
            
        }
        
    }
    
    /**
     得到一个根据屏幕自适应的字体
     */
    func getLayoutContraintFont(fontNumber : CGFloat) -> UIFont {
        
        let size = self.getLayoutConstraintFontSize(fontNumber);
        
        return UIFont.systemFontOfSize(size);
    }
    
    /**
     根据传入的字号获取不同屏幕下的字号
     */
    func getLayoutConstraintFontSize(fontSzie : CGFloat) -> CGFloat {
        
        var size : CGFloat;
        
        let iosDeviceType = self.deviceType!;
        
        switch iosDeviceType {
            
        case .iPhone5s :
            
            size = CGFloat(fontSzie * 0.90);
            
        case .iPhone6s :
            
            size = fontSzie;
            
        default:
            
            size = CGFloat(fontSzie * 1.104);
            
        }
        return size;
    }
    
}
