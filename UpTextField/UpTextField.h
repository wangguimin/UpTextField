//
//  UpTextField.h
//  OralRobot
//
//  Created by 王桂敏 on 16/5/10.
//  Copyright © 2016年 wangguimin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WGMTextField.h"
#import "UIView+AddLine.h"

@class UpTextField;

@protocol UpTextFieldDelegate <NSObject>
@optional
/**
 *  输入框内容修改调用的方法
 *
 *  @param upTF      当前UpTextField对象
 *  @param textField 输入框对象
 */
- (void)upTextFieldChange:(UpTextField *)upTF
                textField:(UITextField *)textField;

- (void)upTextFieldShouldBeginEditing:(UpTextField *)upTF
                         textField:(UITextField *)textField;

- (void)upTextFieldDidEndEditing:(UpTextField *)upTF;


@end
 
@interface  UpTextField: UIView<UITextFieldDelegate>

@property (nonatomic,assign) id<UpTextFieldDelegate> delegate;
@property (nonatomic,strong) WGMTextField *textField;
@property (nonatomic,strong) UILabel *lable;
@property (nonatomic,strong) UIButton *rightView;
@property (nonatomic,assign) BOOL isPhone;//    是不是手机号,默认为NO
@property (nonatomic,assign) BOOL isPassword;// 是不是密码


- (instancetype)initWithFrame:(CGRect)frame
                  placeholder:(NSString *)placeholder
                        image:(NSString *)imageName
                 keyboardType:(UIKeyboardType)keyboardType
                     delegate:(id<UpTextFieldDelegate>)delegate;
//  所有的对象复位
- (void)resetAllUpTextField;
- (void)becomeFirstRespond;
//  textField的rightVIew
- (void)setRightViewWithNormalImage:(NSString *)normalImage
                  selectedImageView:(NSString *)selectedImageView;

- (void)setText:(NSString *)text;
@end
