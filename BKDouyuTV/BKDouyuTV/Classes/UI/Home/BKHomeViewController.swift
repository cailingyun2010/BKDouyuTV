//
//  BKHomeViewController.swift
//  BKDouyuTV
//
//  Created by 董招兵 on 2016/9/19.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

class BKHomeViewController: BKBaseViewController , BKSegmentControlViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(segmentControl)
        self.setupNavbarItems()
        self.setupChildViewController()
    }
    
    private func setupNavbarItems() {
        
        // 昨天的按钮
        let button = UIButton.init(type: .Custom)
        button.setImage(UIImage.init(named: "Image_launch_logo"), forState: .Normal)
        button.addTarget(self, action: #selector(BKHomeViewController.leftButtonItemClick(_:)), forControlEvents: .TouchUpInside)
        button.frame = CGRectMake(0.0, 0.0, 50.0, 21.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
    
        
        let historyItem = UIBarButtonItem.init(image: UIImage.init(named: "image_my_history"), style: .Plain, target: self, action: nil)
        
        let barcodeItem = UIBarButtonItem.init(image: UIImage.init(named:"Image_scan"), style: .Plain, target: self, action: nil)
        
        let searchItem  = UIBarButtonItem.init(image: UIImage.init(named : "btn_search"), style: .Plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItems = [barcodeItem,searchItem,historyItem]

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NJLog(self.scrollView.frame)
        
    }
    
    /// 设置四个子控制器
    private func setupChildViewController() {
        
        // 推荐
        let recommendVC = BKRecommendViewController()
        self.addChildViewController(recommendVC)
        // 游戏
//        let gameVC = BKGameViewCotroller()
//        self.addChildViewController(gameVC)
//        // 娱乐
//        let amusementVC = BKAmusementViewController()
//        self.addChildViewController(amusementVC)
//        // 趣玩
//        let interestVC = BKInterestViewController()
//        self.addChildViewController(interestVC)
        
        let scrollHieght = KScreenHeight - CGFloat(157.0)
        
        NJLog(scrollHieght)
        
        var lastView : UIView?
        
        for i in 0..<self.childViewControllers.count {
            
            let childVC             = self.childViewControllers[i] as UIViewController
            let subView             = childVC.view;
            subView.backgroundColor = UIColor.RandomColor()
            
            self.scrollView.addSubview(subView);
            
            subView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(self.scrollView);
            make.size.equalTo(CGSizeMake(KScreenWidth,  scrollHieght - 49.0))
                if lastView != nil  {
                    make.left.equalTo((lastView?.snp_right)!);
                } else {
                    make.left.equalTo(self.scrollView);
                }
            })
            
            lastView = subView;

            self.scrollView.contentSize = CGSizeMake(KScreenWidth * CGFloat(self.childViewControllers.count), scrollHieght)
            
        }
        
    }
    
    
    @objc private func leftButtonItemClick(item : UIBarButtonItem) {
        
    }

    private lazy var segmentControl : BKSegmentControlView = {
        
        let segView = BKSegmentControlView.init(titleArray : ["推荐","游戏","娱乐","趣玩"], frame: CGRect.init(x: 0.0, y: 0.0, width: KScreenWidth, height: 44.0))
        segView.backgroundColor = UIColor.RandomColor()
        segView.delegate    = self
        
        return segView;
        
    }()
    
    //MARK:BKSegmentControlViewDelegate
    func bk_SegmentControlView(segmentView: BKSegmentControlView, didSelectAtIndex index: Int) {
        
        self.scrollView.setContentOffset(CGPointMake(KScreenWidth * CGFloat(index), 0.0), animated: true)
        
        
    }

}
