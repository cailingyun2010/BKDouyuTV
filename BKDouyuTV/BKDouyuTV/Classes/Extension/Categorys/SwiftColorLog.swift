//
//  SwiftColorLog.swift
//  Baye
//
//  Created by dzb on 16/8/19.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import Foundation


struct ColorLog {
    // 决定颜色输出的标识
    static let ESCAPE   = "\u{001b}["
    // 决定前景色还是背景色
    static let RESET_FG = ESCAPE + "fg;"// Clear any foreground color
    static let RESET_BG = ESCAPE + "bg;"// Clear any background color
    static let RESET    = ESCAPE + ";"// Clear any foreground or background color

    // 红色输出
    static func red<T>(object: T) {
        #if !DEBUG
            print("\(ESCAPE)fg255,85,85;\(object)\(RESET)")
        #endif
    }
    
    // 绿色输出
    static func green<T>(object: T) {
        
        #if !DEBUG
//            let scanner = NSScanner(string: "0x1f448")
//            var result: UInt32 = 0
//            scanner.scanHexInt(&result)
//            let emoji = "\(Character(UnicodeScalar(result)))"
            print("📍"+"\(ESCAPE)fg250,202,0;\(object)\(RESET) 🎈")
        #endif
        
    }
    
    // 蓝色输出
    static func blue<T>(object: T) {
        
        #if !DEBUG
            print("📍 \(ESCAPE)fg255,48,48;\(object)\(RESET) 🎈")
        #endif
        
    }
    
    //黄色输出
    static func yellow<T>(object: T) {
        #if !DEBUG
            print("📍 \(ESCAPE)fg242,196,15;\(object)\(RESET) 🎈")
        #endif
    }
    
    //紫色输出
    static func purple<T>(object: T) {
        #if !DEBUG
            print("📍 \(ESCAPE)fg255,0,255;\(object)\(RESET) 🎈")
        #endif
    }
    
    //青色输出
    static func cyan<T>(object: T) {
        #if !DEBUG
            print("📍 \(ESCAPE)fg48,191,94;\(object)\(RESET) 🎈")
        #endif
    }
    
    // 打印两个对象分别蓝色和黄色输出
    static func blueAndYellow<T>(obj1:T,obj2:T) {
        #if !DEBUG
            print("📍 \(ESCAPE)fg0,0,255;\(obj1)\(RESET)" + "\(ESCAPE)fg255,255,0;\(obj2)\(RESET)  🎈")
        #endif
    }
    
    // 亮蓝色输出
    static func lightBlue<T>(obj1:T) {
        #if !DEBUG
//            let scanner = NSScanner(string: "0x1f449")
//            var result: UInt32 = 0
//            scanner.scanHexInt(&result)
//            let emoji = "\(Character(UnicodeScalar(result)))"
            print("📍"+"\(ESCAPE)fg41,128,185;\(obj1)\(RESET) 🎈")
        #endif
    }
}
