//
//  UIColor+ColorWithHexStrig.m
//  ColorWithHexString
//
//  Created by  on 15-5-4.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "UIColor+ColorWithHexStrig.h"

@implementation UIColor (ColorWithHexStrig)
//根据十六进制数值获取UIColor
+ (UIColor *)colorWithHexString:(NSString *)hexString{
    //去掉字符串两端的空格，并且取小写转换大写
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    //当给定的字符串长度小于6时，返回透明的
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([colorString hasPrefix:@"0X"])
        colorString = [colorString substringFromIndex:2];
    if ([colorString hasPrefix:@"#"])
        colorString = [colorString substringFromIndex:1];
    if ([colorString length] != 6)
        return [UIColor clearColor];
    
    unsigned int red = 0,green = 0,blue = 0;
    NSRange range = NSMakeRange(0, 2);
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&blue];
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
                          alpha:(CGFloat)alpha{
    
    //去掉字符串两端的空格，并且取小写转换大写
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    //当给定的字符串长度小于6时，返回透明的
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([colorString hasPrefix:@"0X"])
        colorString = [colorString substringFromIndex:2];
    if ([colorString hasPrefix:@"#"])
        colorString = [colorString substringFromIndex:1];
    if ([colorString length] != 6)
        return [UIColor clearColor];
    
    unsigned int red = 0,green = 0,blue = 0;
    NSRange range = NSMakeRange(0, 2);
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&blue];
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];


}
@end
