//
//  BKTabBarController.swift
//  BKDouyuTV
//
//  Created by 董招兵 on 2016/9/19.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

class BKTabBarController: UITabBarController , BKWelcomeViewControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectMainViewController()
    
    }
    
    var judeViewController : BKWelcomeViewController?

    /// 选择要显示的主控制器
    func selectMainViewController() {
        
        if isJudgeIsFirstOpenApp() {
            let welcomeVC                   = BKWelcomeViewController()
            welcomeVC.view.frame            = (self.view?.bounds)!
            welcomeVC.view.backgroundColor  = UIColor.whiteColor()
            welcomeVC.delegate              = self
            self.view?.addSubview(welcomeVC.view)
            self.judeViewController = welcomeVC
        }
        
        
    }
    
    /// 是否是第一次打开应用
    func isJudgeIsFirstOpenApp() -> Bool {
        
        let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as! String
        let lastVersion = (NSUserDefaults.standardUserDefaults().objectForKey("versionKey") ?? "") as! String
            
        if currentVersion == lastVersion {
            return false
        }else{
            
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: "versionKey")
            
            return true
        }
    }
    
    /// 点击启动页立即开始按钮
    func bkWelcomeViewController(vc: BKWelcomeViewController?) {
    
        self.judeViewController = nil
    }
    
    override class func initialize() {

        let tabbarItem = UITabBarItem.appearance()
        tabbarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.lightGrayColor()], forState: .Normal)
        tabbarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], forState: .Selected)
        UITabBar.appearance().tintColor = UIColor.orangeColor()

       
    }
}



