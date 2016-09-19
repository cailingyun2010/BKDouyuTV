//
//  NSLayoutConstraintExtension.swift
//  Baye
//
//  Created by dzb on 16/7/23.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AutoLayout 约束更新类
extension NSLayoutConstraint {
    
    /**
     更新约束
     */
    func updateConstraint(value : CGFloat)  {
        
        self.constant = CYLayoutConstraintValue(value)
        
    }
    
    
    
}