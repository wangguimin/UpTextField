//
//  UIView+Extension.h
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 王桂敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

- (UIViewController *)viewController; 

+ (UIView *)viewWithFrame:(CGRect)frame
                  bgColor:(UIColor *)bgColor;

//  在视图底部添加线条
- (void)addLineAtBottomWithLineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor;
//  在视图中添加线条
- (void)addLineWithLineWidth:(CGFloat)lineWidth
                  startPoint:(CGPoint)startPoint
                    endPoint:(CGPoint)endPoint
                   lineColor:(UIColor *)lineColor;
@end
