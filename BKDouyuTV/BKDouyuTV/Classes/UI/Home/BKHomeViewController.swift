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
        
    }

    private lazy var segmentControl : BKSegmentControlView = {
        
        let segView = BKSegmentControlView.init(titleArray : ["推荐","游戏","娱乐","趣玩"], frame: CGRect.init(x: 0.0, y: 0.0, width: KScreenWidth, height: 44.0))
        segView.delegate    = self
        return segView;
        
    }()
    
    //MARK:BKSegmentControlViewDelegate
    func bk_SegmentControlView(segmentView: BKSegmentControlView, didSelectAtIndex index: Int) {
        
        
        NJLog(index)
        
        
    }

}
