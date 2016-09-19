//
//  UIViewControllerExtension.swift
//  Baye
//
//  Created by dzb on 16/7/30.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit



var titleStrKey  = "title"
var detilsStrKey = "detils"
var sureTitleKey = "sure"
var needShowNavigaitonBarKey = "needShowNavigaitonBarKey"

extension UIViewController {
    
    
    /// 是否显示导航控制器
    var needShowNavigationBar : Bool {
        
        set (value) {
            let number = NSNumber.init(bool: value)
            objc_setAssociatedObject(self, &needShowNavigaitonBarKey, number, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
        
        get {
            
            let number = objc_getAssociatedObject(self, &needShowNavigaitonBarKey) as? NSNumber

            guard number != nil else {
                return true
            }
           return (number?.boolValue)!
            
        }
    }
    /**
     通过类名从 UIViewControler 的子控制器里找出类名对象的那个子控制器 可能为 nil
     */
    func findChildViewController(aClass : AnyClass?) -> UIViewController? {
        
        if self.childViewControllers.count == 0 || aClass == nil  {
            
            return nil
        }
        
        let controllerName = stringFromClass(aClass)
        
        for viewController in self.childViewControllers { 
            
            let string    = NSStringFromClass(viewController.dynamicType)

            if string == controllerName {

                return viewController;
            }
            
        }
    
        return nil
    }

    /**
     根据类名找到这个类在 UIViewCotroller 子控制器的 index
     */
    func indexOfChildController(aClass : AnyClass) -> Int? {
        
        if self.childViewControllers.count == 0   {

            return nil
        }
        
        if let controller = self.findChildViewController(aClass)  {
            
            return self.childViewControllers.indexOf(controller);
        }
      
        return nil
    }
    
    func indexOfChildController(viewController : UIViewController?) -> Int? {
        
        if viewController == nil  {
            return nil
        }
        if self.childViewControllers.contains(viewController!) {
            return self.childViewControllers.indexOf(viewController!)
        } else {
            return nil
        }

    }

       func isRooViewController() -> Bool {
        
        let parentVC    = self.parentViewController

        guard parentVC != nil else {
            return false
        }

        let index = parentVC?.childViewControllers.indexOf(self)

        guard index != 0 else {
            return false
        }

        return true
    }
    
 
    
    
}


extension UINavigationController {
    
    /**
     pop 到指定的控制器 根据类名
     */
    func popToViewControllerWithName(aClass : AnyClass,animated: Bool) {
        
        if let controller = self.findChildViewController(aClass) {
        
            let currentController = self.viewControllers.last
            
            assert(controller != currentController, "\n\n 你不能 pop 到当前显示的控制器,用popViewControllerAnimated 代替 \n\n ")

            if controller != currentController {
                
                self.popToViewController(controller, animated: animated)

            }
            
        } else {
            
            assert(false, " \n\n传入当前控制器不在 导航控制器 ViewControllers 里 \n\n")

        }
        

    }
    
    /**
     延迟几秒后执行 pop 操作
     
     - parameter animated: 是否需要动画
     - parameter delay:    延时时间
     */
    func popViewControllerAnimated(animated : Bool ,delay : Double) {
        
        self.performSelector(#selector(UINavigationController.popViewControllerAnimated(_:)), withObject: animated, afterDelay: delay)
        
    }
    /**
     延时时间调用 pop 方法到指定控制器
     */
    func popToViewController(viewController: UIViewController, animated: Bool ,delay : Double){
        
        self.performSelector(#selector(UINavigationController.popToViewController(_:animated:)), withObject: animated, afterDelay: delay)
        
    }
    
    /**
     延时方法 pop 到根控制器
     */
     func popToRootViewControllerAnimated(animated: Bool ,delay : Double)
     {
        self.performSelector(#selector(UINavigationController.popToRootViewControllerAnimated(_:)), withObject: animated, afterDelay: delay)
     }
    
    
}




