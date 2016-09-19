import Foundation
import UIKit

let KScreenWidth  = UIScreen.mainScreen().bounds.size.width
let KScreenHeight = UIScreen.mainScreen().bounds.size.height

extension UIView {
    
    var left : CGFloat {
        let viewLeft = CGRectGetMinX(self.frame);
        return viewLeft
    }
    var right : CGFloat {
        return CGRectGetMaxX(self.frame);
    }
    
    var width : CGFloat {
        return CGRectGetWidth(self.frame);
    }
    var height : CGFloat {
        return CGRectGetHeight(self.frame)
    }
    
    var top : CGFloat {
        return CGRectGetMinY(self.frame)
    }
    
    var bottom : CGFloat {
        return CGRectGetMaxY(self.frame)
    }
    
    var size : CGSize {
        return self.frame.size
    }
    func setX(x : CGFloat) {
        var rect      = self.frame;
        rect.origin.x = x;
        self.frame    = rect;
    }
    func setY(y : CGFloat) {
        var rect      = self.frame;
        rect.origin.y = y;
        self.frame    = rect;
    }
    func setWidth(width : CGFloat) {
        var rect        = self.frame;
        rect.size.width = width;
        self.frame      = rect;
    }
    
    func setHeight(height : CGFloat) {
        var rect         = self.frame;
        rect.size.height = height;
        self.frame       = rect;
    }
    
    /**
     从 XIB 加载一个 view
     */
    class func viewFromNib() -> UIView? {
        
        let className = self.className()?.componentsSeparatedByString(".").last
        
        guard let nib : AnyObject? = NSBundle.mainBundle().loadNibNamed(className! as String, owner: nil, options: nil)!.last else {
            // need throws the error out
            return nil
        }
        
        let view = nib as? UIView
        
        return view
        
    }
    
    /**
     从一个 view 上找到它所在的控制器
     */
    func findViewController() -> UIViewController {
        
        let  target = self
        
        while ((self.nextResponder()) != nil) {
            
            let resonpnder = target.nextResponder()! as UIResponder
            
            if (resonpnder.isKindOfClass(UIViewController.self)) {
                
                break
            }
        }
        
        return UIViewController()
    }
    
    /**
     移除所有子视图
     */
    func removeAllSubviews() {
        
        while self.subviews.count > 0 {
            
            let view = self.subviews.last
            view?.removeFromSuperview()
            
        }
        
        
    }
    
    /**
     给一个 view 添加手势事件
     */
    func addTarget(target : AnyObject?, action : Selector?) {
        
        if ((target == nil) || (action == nil)) {
            return
        }
        
        self.userInteractionEnabled = true;
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: target, action: action!))    
        
    }
    
}


extension UIButton {
    
    /**
     给按钮设置不同状态下的颜色
     */
    func setBackgroundColor(backgroundColor color: UIColor? ,forState state: UIControlState) {
    
        guard color != nil else {
            return
        }
        
        self.setBackgroundImage(UIImage.imageWithColor(color!), forState: state)
    }
    
    
    
}

extension UIImage {
    
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



