//
//  WGMTextField.m
//  OralRobot
//
//  Created by 王桂敏 on 2016/11/9.
//  Copyright © 2016年 wangguimin. All rights reserved.
//

#import "WGMTextField.h"

@implementation WGMTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (BOOL)isPassword{
    if (!_isPassword) {
        self.isPassword = NO;
    }
    return _isPassword;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (self.isPassword) {
        return NO;
    }
    return YES;
}

@end
