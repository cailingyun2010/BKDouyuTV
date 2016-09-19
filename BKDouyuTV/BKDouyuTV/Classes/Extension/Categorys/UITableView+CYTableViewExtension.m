//
//  UITableView+CYTableViewExtension.m
//  Junengwan
//
//  Created by dongzb on 16/6/12.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

#import "UITableView+CYTableViewExtension.h"
#import <objc/runtime.h>

static NSString *tipViewKey = @"tipViewKey";


@implementation UITableView (CYTableViewExtension)
/**
 *  是否显示没有更多数据的提示
 *
 *  @param isShow 是/否
 */
- (void)showEndTipViewText:(NSString *)text showTipView:(BOOL)isShow {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        objc_setAssociatedObject(self, &tipViewKey, text, OBJC_ASSOCIATION_COPY_NONATOMIC);
        if (isShow) {
            [self addFooterView];
        }else {
            
            [self removeFooterView];
        }
    });

}
/**
 *  添加footerView
 */
- (void)addFooterView {
    
    if (self.tableFooterView && [self.tableFooterView isKindOfClass:[UILabel class]]) {
        
        self.tableFooterView.hidden = NO;
        
    } else {
        
        UILabel *footViewLab            = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 44.0f)];
        footViewLab.textColor           = [UIColor lightGrayColor];
        footViewLab.textAlignment       = NSTextAlignmentCenter;
        footViewLab.font                = [UIFont systemFontOfSize:12.0f];
        
        NSString *title                 = objc_getAssociatedObject(self, &tipViewKey);
        if (title) {
            footViewLab.text = title;
        } else {
            footViewLab.text                = @"没有更多内容了";

        }
        
        self.tableFooterView            = footViewLab;
    }
    
}
/**
 *  移除 footerView
 */
- (void)removeFooterView {
    
    self.tableFooterView.hidden = YES;
    
}

@end
