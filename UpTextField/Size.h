//
//  Size.h
//  OralRobot
//
//  Created by 王桂敏 on 16/3/23.
//  Copyright © 2016年 huayingdai. All rights reserved.
//
#import "NSString+Category.h"
#import "UIColor+ColorWithHexStrig.h"
#ifndef Size_h
#define Size_h
//  颜色
#define ColorWithHexString(str) [UIColor colorWithHexString:str]
#define GlobalGray ColorWithHexString(@"cccccc")
#define GlobalBlue ColorWithHexString(@"50cbff")

//  字体
#define font(size) [UIFont systemFontOfSize:((size / 2) / kScreenHeight6) * kScreenHeight]

#define kScreenWidth [UIScreen mainScreen].bounds.size.width//  屏幕的宽
#define kScreenHeight [UIScreen mainScreen].bounds.size.height// 屏幕的高

#define kScreenWidth6 375.0//  6屏幕的宽
#define kScreenHeight6 667.0// 6屏幕的高

#define kScreenWidth5 320.0//  5屏幕的宽
#define kScreenHeight5 568.0// 5屏幕的高

#define kWidth(width) (width / kScreenWidth5) * kScreenWidth//  宽
#define kHeight(height) (height / kScreenHeight5) * kScreenHeight// 高

#define kLeftButtonOffset   kWidth(-30)//   返回按钮的偏移量

#define getH(view) CGRectGetHeight(view.frame)
#define getW(view) CGRectGetWidth(view.frame)
#define getMinY(view) CGRectGetMinY(view.frame)
#define getMidY(view) CGRectGetMidY(view.frame)
#define getMaxY(view) CGRectGetMaxY(view.frame)
#define getMinX(view) CGRectGetMinX(view.frame)
#define getMidX(view) CGRectGetMidX(view.frame)
#define getMaxX(view) CGRectGetMaxX(view.frame)

#define h(height) kHeight(height / 3)
#define w(width) kWidth(width / 3)

#define SizeZoom  [UIScreen mainScreen].bounds.size.width/320

// Status bar height
#define  StatusBarHeight      20.f

// Navigation bar height.
#define  NavigationBarHeight  44.f

// Tabbar height. self.tabBarController.tabBar.height
#define  TabbarHeight         49.f

// Status bar & navigation bar height.
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)

#endif /* Size_h */
