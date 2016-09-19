//
//  UITabBarItem+Extension.m
//  BKTabbar
//
//  Created by dzb on 16/8/17.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

#import "UITabBarItem+Extension.h"
#import <objc/runtime.h>

static NSString *const kItemTagKey     = @"tags";

static NSString *const kItemBadgeValue = @"badgeValue";


@implementation UITabBarItem (Extension)

- (void)setIndex:(NSInteger)index {
    
    NSNumber *number =  [NSNumber numberWithInteger:index];
    objc_setAssociatedObject(self, &kItemTagKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


- (NSInteger)index {
    
    NSNumber *number = (NSNumber *)objc_getAssociatedObject(self, &kItemTagKey);
    return number.integerValue;
    
}

- (void)setCustomBadgeValue:(NSString *)customBadgeValue {
    
    objc_setAssociatedObject(self, &kItemBadgeValue, customBadgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TabbarBadgeValueChange" object:self];

}

- (NSString *)customBadgeValue {
    
    NSString *value = (NSString *)objc_getAssociatedObject(self, &kItemBadgeValue);

    return value;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    
    self.customBadgeValue   = badgeValue;
}

@end
