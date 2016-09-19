//
//  UITableView+CYTableViewExtension.h
//  Junengwan
//
//  Created by dongzb on 16/6/12.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CYTableViewExtension)

/**
 *  是否显示没有更多数据的提示
 *
 *  @param isShow 是/否
 */
- (void)showEndTipViewText:(NSString *)text showTipView:(BOOL)isShow;

@end
