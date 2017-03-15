//
//  NSString+IsPhone.h
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

@interface NSString (IsPhone)

/**
 * 判断字符串是否是手机号码格式
 */
- (PhoneType)isPhone;


@end
