//
//  NSString+Category.h
//  OralRobot
//
//  Created by 王桂敏 on 16/5/30.
//  Copyright © 2016年 wangguimin. All rights reserved.
//

#import <Foundation/Foundation.h>

//  电话号码的判断类型
typedef NS_OPTIONS(NSUInteger, PhoneType) {
    PhoneTypeYes,// 正确的电话号
    PhoneTypeNo,//  不是电话号
    PhoneTypeError// 不正确的电话号
};

@interface NSString (Category)

/*
 * 判断字符串是否为空白的
 */
- (BOOL)isBlank;

/*
 * 判断字符串是否为空
 */
- (BOOL)isEmpty;

/*
 * 给字符串md5加密
 */
- (NSString *)md5;

/**
 * 判断字符串是否是6位长度的验证码
 */
- (BOOL)isVerificationCode;

/**
 * 判断字符串是否是密码格式
 */
- (BOOL)isPassword;

/**
 * 判断字符串是否是email格式
 */
- (BOOL)isEmail;

/**
 * 判断字符串是否是手机号码格式
 */
- (PhoneType)isPhone;

- (NSUInteger)wordCount:(NSString *)str;

- (NSString *)getEncodeUrlString;
@end
