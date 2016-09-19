
import Foundation
import UIKit
import MJExtension

/**
 根据一个类找到这个类字符串
 */
public func stringFromClass(aClass : AnyClass?) -> String? {
    
    if aClass == nil {
        return nil
    }
    
    let className = NSStringFromClass(aClass!)
    return className
}

/**
 从一个字符串生成一个类
 */
public func classFromString(className : String?) -> AnyClass? {
    
    if className == nil {
        return nil
    }
    
    guard let name =  NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else
    {
        NJLog("获取命名空间失败")
        return nil
    }
    
    let cls: AnyClass? = NSClassFromString(name + "." + className!)
    
    return cls
}


extension NSObject {
    
    /**
     获取类名 命名空间.加文件名 如 Baye.Home
     */
    public class func className() -> String? {
        
        let className = stringFromClass(self)
        guard className != nil else {
            return nil
        }
        
        return className
    }
    
    /**
     字典数组转模型数组
     */
    class func bk_objectArrayWithKeyValues<T>(json : [AnyObject] , type : T) -> [T] {
        
        var array                       = [T]()
        let models                      = self.mj_objectArrayWithKeyValuesArray(json) 
        
        for i in 0..<models.count {
            
            let data = models[i]
            array.append(data as! T)
            
        }
        
        return array
    }
    /**
     将一个字典转成一个模型属性
     */
    class func bk_objectWithKeyValues(json : [String : AnyObject]) -> Self {
        
        let obj = self.mj_objectWithKeyValues(json)
        
        return obj
        
    }
    /**
     给一个模型重新赋值,属性名对应字典中的 key, 如果 key 对于的 value 有值就替换模型属性的值
     */
     func replaceNotNullValueWithKeyValues(keyValues:[String : AnyObject]?)  {

        if keyValues == nil {
            return
        }
        // 对象属性字典
        let objKeyValues = self.bk_keyValues
        // 对象的属性名集合
        let allKeys      = objKeyValues?.allKeys

        for key in allKeys! {
                
            if keyValues?.keys.contains(key as! String) == true {
                
                if let newValue  = keyValues![key as! String] {
                    NJLog("key =\(key) value =\(newValue)")
                    
                    if newValue as! NSObject == NSNull() {
                        continue
                    }
                    self.setValue(newValue, forKey: key as! String)
                }
            }
            
            
        }
        
    }
    /// 一个类对象的类型 AnyClass
    var classType : AnyClass {
        get {
            return self.classForCoder
        }
    
    }
    ///  一个类成员变量集合
    var bk_keyValues : NSMutableDictionary? {
        
        get {
            
            let keyValues = NSMutableDictionary()
            
            //存放属性的个数
            var outCount:UInt32 = 0
            //获取所有的属性
            let properties = class_copyPropertyList(self.classForCoder, &outCount)
            //遍历属性
            for i in 0..<Int(outCount) {
                
                //获取第i个属性
                let property = properties[i]
                //得到属性的名字
                let key      = NSString(CString: property_getName(property), encoding: NSUTF8StringEncoding)! as String
                

                
                if let value    = self.valueForKey(key) {

                    keyValues.setObject(value, forKey: key)
                } else {
                    let null = NSNull()
                    keyValues.setObject(null, forKey: key)
                }
                
                
//                NJLog("keyValues \(keyValues)")

            }
            
            return keyValues 
        }
      
        
      
    }
}

