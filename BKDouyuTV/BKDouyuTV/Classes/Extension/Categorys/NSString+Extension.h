//
//  NSString+MHCommon.h
//  PerfectProject
//
//  Created by Meng huan on 14/11/19.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  NSString 通用Category
 */
@interface NSString (Extension)

#pragma mark - MD5加密
/**
 *  MD5加密
 *
 *  @return MD5加密后的新字段
 */
- (NSString *)md5;

#pragma mark - URL编码
/**
 *  URL编码，http请求遇到汉字的时候，需要转化成UTF-8
 *
 *  @return 编码的字符串
 */
- (NSString *)urlCodingToUTF8;
#pragma mark - URL解码
/**
 *  URL解码，URL格式是 %3A%2F%2F 这样的，则需要进行UTF-8解码
 *
 *  @return 解码的字符串
 */
- (NSString *)urlDecodingToUrlString;
/**
 *  计算字符串尺寸
 *
 *  @param font   字体大小
 *  @param string 文字内容
 *  @param width   限定文字的宽度
 *  @return 返回一个 CGSize类型结构体
 */
-(CGSize)getTextSizeWithFont:(CGFloat)fontSize restrictWidth:(float)width;
/**
 *  计算富文本的尺寸
 *
 *  @param width  限制宽度
 *  @param string 高度
 *
 *  @return 返回CGSize
 */
-(CGSize)getAttributedTextSizeWithRestrictWidth:(float)width  withString:(NSAttributedString*)string;
/**
 *  判断字符串是否是 bool 类型的
 */
- (BOOL)stingIsBoolValue;
/**
 *  银行卡号验证
 */
+ (BOOL) isValidCreditNumber:(NSString*)value;

/**
 *  身份证号验证
 */
+(BOOL)checkIdentityCardNo:(NSString*)cardNo;

@end
