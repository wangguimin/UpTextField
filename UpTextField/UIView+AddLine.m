//
//  UIView+AddLine.m
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 王桂敏. All rights reserved.
//

#import "UIView+AddLine.h"

@implementation UIView (AddLine)



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
