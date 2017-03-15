//
//  UIColor+ColorWithHexStrig.h
//  ColorWithHexString
//
//  Created by on 15-5-4.
//  Copyright (c) 2015年. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorWithHexStrig)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString
                          alpha:(CGFloat)alpha;
@end
