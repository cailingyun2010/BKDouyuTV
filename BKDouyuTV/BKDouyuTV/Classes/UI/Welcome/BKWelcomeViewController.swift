//
//  BKWelcomeViewController.swift
//  BKDouyuTV
//
//  Created by 董招兵 on 2016/9/19.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

protocol BKWelcomeViewControllerDelegate : NSObjectProtocol  {
    
    func bkWelcomeViewController(vc : BKWelcomeViewController?)
}


class BKWelcomeViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
     weak var delegate : BKWelcomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<4 {
            
            var imageName = ""
            
            switch CYLayoutConstraint.shareInstance.currenDeviceType() {
            case .iPhone5s:
                imageName = String.init(format: "%dwelcome1136.png", i)
                break
            case .iPhone6s :
                imageName = String.init(format: "%dwelcome1334.png", i)
                
                break
                
            case .iPhone6SP :
                imageName = String.init(format: "%dwelcome1472.png", i)
                
                break
                
            default :
                imageName = String.init(format: "%dwelcome960.png", i)
                break
            }
            
            let image = UIImage.init(named: imageName)
            
            let imageView = UIImageView.init(image: image)
            
            imageView.frame = CGRect.init(x: CGFloat(i) * KScreenWidth, y: 0.0, width: KScreenWidth, height: KScreenHeight)
            self.scrollView.addSubview(imageView)
            
            if i == 3 {
                
                imageView.userInteractionEnabled  = true
                
                let button = UIButton.init(type: .Custom)
                button.setTitle("点击开始", forState: . Normal)
                button.setTitleColor(UIColor.redColor(), forState: .Normal)
                button.addTarget(self, action: #selector(BKWelcomeViewController.startForApp), forControlEvents: .TouchUpInside)
                let x = CGFloat((KScreenWidth - 80.0) / 2.0)
                button.titleLabel?.font = UIFont.systemFontOfSize( 15.0)
                button.frame        = CGRect.init(x: x, y: KScreenHeight - 100.0, width: 80.0, height: 30.0)
                
                imageView.addSubview(button)
                
            }
            
        }
        
        self.scrollView.contentSize = CGSize.init(width: KScreenWidth * 4.0, height: KScreenHeight)
        
        
    }
    
    
    func startForApp() {
        
        self.view.removeFromSuperview()
        self.delegate?.bkWelcomeViewController(self)
        
    }
    
    
    deinit {
    
        
        NJLog("被销毁了")
        
    }
    
    

}


