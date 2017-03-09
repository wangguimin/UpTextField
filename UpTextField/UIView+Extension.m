//
//  UIView+Extension.m
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 王桂敏. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

+ (UIView *)viewWithFrame:(CGRect)frame
                    bgColor:(UIColor *)bgColor{
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = bgColor;
    return view;
    
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
//    self.width = size.width;
//    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)addLineAtBottomWithLineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor{
    
    CGPoint startPoint = CGPointMake(0, self.frame.size.height - lineWidth);
    CGPoint endPoint = CGPointMake(self.frame.size.width, self.frame.size.height - lineWidth);
    [self addLineWithLineWidth:lineWidth startPoint:startPoint endPoint:endPoint lineColor:lineColor];
    
}

- (void)addLineWithLineWidth:(CGFloat)lineWidth
                  startPoint:(CGPoint)startPoint
                    endPoint:(CGPoint)endPoint
                   lineColor:(UIColor *)lineColor{
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = lineWidth;
    lineLayer.lineCap = kCALineCapButt;
    lineLayer.strokeColor = lineColor.CGColor;
    lineLayer.fillColor = nil;
    CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y);
    CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y);
    lineLayer.path = path;
    
    [self.layer addSublayer:lineLayer];
    
}

@end
