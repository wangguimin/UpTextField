//
//  NSString+Category.m
//  OralRobot
//
//  Created by 王桂敏 on 16/5/30.
//  Copyright © 2016年 wangguimin. All rights reserved.
//

#import "NSString+Category.h"
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Category)


/*
 * 判断字符串是否为空白的
 */
- (BOOL)isBlank
{
    if ((self == nil) || (self.length == 0)) {
        return YES;
    }
    
    NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimedString length] == 0) {
        return YES;
    } else {
        return NO;
    }
    
    return YES;
}

/*
 * 判断字符串是否为空
 */
- (BOOL)isEmpty
{
    return ((self.length == 0) || (self == nil) || ([self isKindOfClass:[NSNull class]]) || (self.length == 0));
}

/*
 * 给字符串md5加密
 */
- (NSString*)md5
{
    const char *ptr = [self UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}


/**
 * 判断字符串是否是6位长度的验证码
 */
- (BOOL)isVerificationCode{
    if (self.length == 0) {
        return NO;
    }
    
    NSString *regex = @"^[0-9]{6}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    if (!isMatch) {
        return NO;
    }
    
    return YES;
}


/**
 * 判断字符串是否是密码格式
 */
- (BOOL)isPassword
{
    
    if (self.length < 6 || self.length > 18) {
        return NO;
    }
   /*
    if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"^[a-zA-Z0-9]{6,18}$";// 密码长度为6-16位字母和数字
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    if (!isMatch) {
        return NO;
    }
    */
    return YES;
}

/**
 * 判断字符串是否是email格式
 */

- (BOOL)isEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/**
 * 判断字符串是否是手机号码格式
 */
- (PhoneType)isPhone
{
    if (self.length == 0) {
        return PhoneTypeNo;
    }
    
    NSString *regex = @"^[0-9]{11}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    if (!isMatch) {
        return PhoneTypeNo;
    }
    
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,157,158,159,178,182,183,184,187,188
     * 联通：130,131,132,145,152,155,156,176,185,186
     * 电信：133,149,153,180,181,189,177,173
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,147,150,151,157,158,159,178,182,183,184,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(4[7]|3[5-9]|5[017-9]|7[8]|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,145,152,155,156,176,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|4[5]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,149,153,180,181,189,177,173
     22         */
    NSString * CT = @"^1((33|49|53|7[37]|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return PhoneTypeYes;
    }
    else
    {
        return PhoneTypeError;
    }
}

- (NSUInteger)wordCount:(NSString *)str{
    
    NSUInteger words = 0;
    NSScanner *scanner = [NSScanner scannerWithString: str];
    // Look for spaces, tabs and newlines
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    while ([scanner scanUpToCharactersFromSet:whiteSpace intoString:nil])
        words++;
    return words;
}

- (NSString *)getEncodeUrlString{
    return (__bridge NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
}
@end
