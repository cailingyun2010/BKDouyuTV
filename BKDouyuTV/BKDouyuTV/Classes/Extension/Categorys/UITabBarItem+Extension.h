//
//  UITabBarItem+Extension.h
//  BKTabbar
//
//  Created by dzb on 16/8/17.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (Extension)

/**
 *  tabBarItem 的 tag
 */
@property (nonatomic,assign) NSInteger index;

/**
 *   自定义 tabBar 的 badgeValue
 */
@property (nonatomic,copy,nullable) NSString *customBadgeValue;

@end
