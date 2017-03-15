//
//  UIView+AddLine.h
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 王桂敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AddLine)

- (CAShapeLayer *)lineWithLineWidth:(CGFloat)lineWidth
                         startPoint:(CGPoint)startPoint
                           endPoint:(CGPoint)endPoint
                          lineColor:(UIColor *)lineColor;

@end
