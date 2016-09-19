//
//  BKSegmentControlView.swift
//  BKDouyuTV
//
//  Created by 董招兵 on 2016/9/19.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit
import SnapKit
@objc protocol BKSegmentControlViewDelegate : NSObjectProtocol {
    
    func  bk_SegmentControlView(segmentView : BKSegmentControlView ,didSelectAtIndex index : Int)
    
}

class BKSegmentControlView: UIView {

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var bottomView : UIView?
    weak var delegate : BKSegmentControlViewDelegate?
    private var selectButton : UIButton?
    private var titles : [String] = [String]()
    var selectIndex : Int = 0 {
        didSet {
            
            let btn = self.viewWithTag(selectIndex + 1000) as! UIButton
            self.setupButtonState(btn)
            self.updateBottomLineConstaint(btn)
            
        }
    }
    
    
    /// 构造方法 初始化时设置 titles
    convenience init(titleArray : [String] ,frame :CGRect) {
        self.init()
        
        self.frame = frame
        self.backgroundColor = UIColor.whiteColor()
        self.titles = titleArray
        self.creatUI()

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    /// 创建 UI
    private func creatUI() {
    
        let buttonWidth     = KScreenWidth / CGFloat(self.titles.count)
        let buttonHeight    = CGRectGetHeight(self.frame)
        for i in 0..<self.titles.count {
            
            let button = UIButton.init(type: .Custom)
            button.frame = CGRectMake( CGFloat(i) * buttonWidth, 0.0, buttonWidth, buttonHeight)
            button.setTitle(titles[i], forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setTitleColor(UIColor.orangeColor(), forState: .Selected)
            button.titleLabel?.font = UIFont.systemFontOfSize(13.0)
            button.titleLabel?.textAlignment = .Center
            button.tag = i + 1000
            button.addTarget(self, action: #selector(BKSegmentControlView.buttonItemClick(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(button)
            
            if i == 0 {
                button.selected     = true
                self.selectButton   = button
            }
            
            
        }
        
        
        self.bottomView = UIView()
        bottomView?.backgroundColor = UIColor.orangeColor()
        self.addSubview(self.bottomView!)
        self.bottomView?.snp_makeConstraints(closure: { (make) in
            make.bottom.equalTo(self).offset(-2.0);
            make.left.equalTo(0.0);
            make.width.equalTo(100.0);
            make.height.equalTo(2.0);
        })
        
        self.layoutIfNeeded()
        self.updateBottomLineConstaint(self.selectButton!)
        
    }
    /// 按钮点击事件
    @objc private func buttonItemClick(btn : UIButton)  {
        
        self.setupButtonState(btn)
        self.updateBottomLineConstaint(btn)
        self.delegate?.bk_SegmentControlView(self, didSelectAtIndex: btn.tag - 1000)
        
    }
   // 更新底部横线约束
   private func updateBottomLineConstaint(btn : UIButton) {
        
        let title = btn.currentTitle
        
        let titleWidth = self.getTextSizeWithFont(UIFont.systemFontOfSize(13.0), restrictWidth: 100.0, text: title!).width
        
        let bottomViewLeft = btn.frame.origin.x + btn.titleLabel!.frame.origin.x;
        let bottomViewWidth = titleWidth
        
        self.bottomView?.snp_updateConstraints(closure: { (make) in
            make.left.equalTo(self).offset(bottomViewLeft)
            make.width.equalTo(bottomViewWidth)
        })
        
        if self.bottomView?.frame.origin.x == 0.0 {
        
            return
        }
        
        UIView.animateWithDuration(0.25) { 
            self.layoutIfNeeded()
            
        }
    }
    
    /// 改变按钮状态
    private func setupButtonState(btn : UIButton) {
        
        selectButton!.selected = false;
        btn.selected        = true;
        selectButton          = btn;
        
    }
    /// 获取文字内容尺寸大小
    private func getTextSizeWithFont(font : UIFont ,restrictWidth width : CGFloat, text : String) -> CGSize {
        
        let dict = [NSFontAttributeName : font]
        let size = (text as NSString).boundingRectWithSize(CGSizeMake(width, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: dict, context: nil).size
        
        return size
    }
}
