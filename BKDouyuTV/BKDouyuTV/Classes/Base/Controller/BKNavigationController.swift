//
//  BKNavigationController.swift
//  BKDouyuTV
//
//  Created by 董招兵 on 2016/9/19.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

class BKNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override class func initialize() {
        
        let navBar                 = UINavigationBar.appearance();
        navBar.barTintColor        = UIColor.RGBColor(255.0, green: 138.0, blue: 56.0);
        navBar.barStyle            = .Black;
        navBar.translucent         = false
        navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(),NSFontAttributeName : UIFont.systemFontOfSize(18.0)];
        
        let barbuttonItem          = UIBarButtonItem.appearance()
        barbuttonItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor(),NSFontAttributeName : UIFont.systemFontOfSize(15.0)], forState: .Normal)
        
        

        
    }

}
