//
//  UpTextField.m
//  OralRobot
//
//  Created by 王桂敏 on 16/5/10.
//  Copyright © 2016年 wangguimin. All rights reserved.
//

#import "UpTextField.h"
#import "UIColor+ColorWithHexStrig.h"
#import "NSString+IsPhone.h"



@interface UpTextField ()

@end
@implementation UpTextField

#pragma mark - 初始化方法 -
- (instancetype)initWithFrame:(CGRect)frame
                  placeholder:(NSString *)placeholder
                        image:(NSString *)imageName
                 keyboardType:(UIKeyboardType)keyboardType
                     delegate:(id<UpTextFieldDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        self.delegate = delegate;
        [self initViewWithPlaceholder:placeholder image:imageName keyboardType:keyboardType];
    }
    return self;
}

- (void)initViewWithPlaceholder:(NSString *)placeholder
                          image:(NSString *)imageName
                   keyboardType:(UIKeyboardType)keyboardType
{
    self.textField = [[WGMTextField alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 3, self.frame.size.width, (self.frame.size.height / 3) * 2) ];
    self.textField.keyboardType = keyboardType;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.font = [UIFont systemFontOfSize:((32 / 2) / 667.0) * [UIScreen mainScreen].bounds.size.height];
    self.textField.textColor = self.textColor;
    
    CGFloat lineWidth = 0.5;
    self.lineLayer = [self lineWithLineWidth:lineWidth startPoint:CGPointMake(0, self.textField.frame.size.height - lineWidth) endPoint:CGPointMake(self.textField.frame.size.width, self.textField.frame.size.height - lineWidth) lineColor:self.lineColor];
    [self.textField.layer addSublayer:self.lineLayer];
    
    
    [self addSubview:self.textField];
    
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height  -  self.frame.size.height * 102 / 180, self.textField.frame.size.width, self.frame.size.height * 48 / 180)];
    self.lable.font = [UIFont systemFontOfSize:((32 / 2) / 667.0) * [UIScreen mainScreen].bounds.size.height];
    self.lable.textColor = self.placeholderColor;
    self.lable.text = placeholder;
    self.lable.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.lable];
    
}
//  数据初始化
- (void)initData{
    self.isPhone = NO;
    self.isPassword = NO;
    self.textColor = [UIColor colorWithHexString:@"333333"];
    self.lineColor = [UIColor colorWithHexString:@"cccccc"];
    self.placeholderColor = [UIColor colorWithHexString:@"cccccc"];
}
#pragma mark - 懒加载 -
- (UIButton *)rightView{
    if (!_rightView) {
        self.rightView = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightView.frame = CGRectMake(0, 0, (150 / 660) * self.frame.size.height, self.textField.frame.size.height);
        _rightView.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        self.textField.rightView = _rightView;
        self.textField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _rightView;
}

#pragma mark - 属性的设置 -
- (void)setIsPassword:(BOOL)isPassword{
    if (isPassword != _isPassword) {
        _isPassword = isPassword;
        self.textField.isPassword = self.isPassword;
    }
    
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    if (placeholderColor != _placeholderColor) {
        _placeholderColor = placeholderColor;
        self.lable.textColor = placeholderColor;
    }
}

- (void)setLineColor:(UIColor *)lineColor{
    if (lineColor != _lineColor) {
        _lineColor = lineColor;
        self.lineLayer.strokeColor = lineColor.CGColor;
    }
}

- (void)setTextColor:(UIColor *)textColor{
    if (textColor != _textColor) {
        _textColor = textColor;
        self.textField.textColor = textColor;
    }
}

- (void)setRightViewWithNormalImage:(NSString *)normalImage
                  selectedImageView:(NSString *)selectedImageView{
    [self.rightView setImage:[UIImage imageNamed:@"normalImage"] forState:UIControlStateNormal];
    [self.rightView setImage:[UIImage imageNamed:@"selectedImageView"] forState:UIControlStateSelected];
}


- (void)setText:(NSString *)text{
    
    if (text.length) {
        if (self.isPhone) {
            self.textField.text = [NSString stringWithFormat:@"%@ %@ %@",[text substringWithRange:NSMakeRange(0, 3)],[text substringWithRange:NSMakeRange(3, 4)],[text substringWithRange:NSMakeRange(7, 4)]];
        } else {
            self.textField.text = text;
        }
        
        [self upPlaceholer];
    } else {
        self.textField.text = text;
        [self resetWithUpTextField:self];
    }
    
}

- (void)becomeFirstRespond{
    [self.textField becomeFirstResponder];
    [self upPlaceholer];
}
//  编辑状态，占位符上移
- (void)upPlaceholer
{
    if (![self textFieldIsText:self]) {
        [UIView animateWithDuration:0.5 animations:^{
            self.lable.transform = CGAffineTransformMakeTranslation(0, -(self.frame.size.height * 60 / 180));
            self.lable.font = [UIFont systemFontOfSize:((20 / 2) / 667.0) * [UIScreen mainScreen].bounds.size.height];
            self.lable.textColor = [UIColor colorWithHexString:@"50cbff"];
            [(CAShapeLayer *)self.textField.layer.sublayers[0] setStrokeColor:[UIColor colorWithHexString:@"50cbff"].CGColor];
        }];
    } else {
        if (![self.lable.font isEqual:[UIFont systemFontOfSize:((20 / 2) / 667.0) * [UIScreen mainScreen].bounds.size.height]]) {
            self.lable.transform = CGAffineTransformMakeTranslation(0, -(self.frame.size.height * 60 / 180));
            self.lable.font = [UIFont systemFontOfSize:((20 / 2) / 667.0) * [UIScreen mainScreen].bounds.size.height];
            self.lable.textColor = [UIColor colorWithHexString:@"50cbff"];
            [(CAShapeLayer *)self.textField.layer.sublayers[0] setStrokeColor:[UIColor colorWithHexString:@"50cbff"].CGColor];
        }
    }
    

}

//  控件复位
- (void)resetWithUpTextField:(UpTextField *)upTF
{
    if (![self textFieldIsText:upTF]) {
        [UIView animateWithDuration:0.5 animations:^{
            upTF.lable.transform = CGAffineTransformIdentity;
            upTF.lable.font = [UIFont systemFontOfSize:((32 / 2) / 667.0) * [UIScreen mainScreen].bounds.size.height];
            upTF.lable.textColor = [UIColor colorWithHexString:@"cccccc"];
            [(CAShapeLayer *)upTF.textField.layer.sublayers[0] setStrokeColor:[UIColor colorWithHexString:@"cccccc"].CGColor];
        }];
    }
    
}
//  判断输入框中是否有数据
- (BOOL)textFieldIsText:(UpTextField *)upTF
{
    if (upTF.textField.text.length == 0) {
        return NO;
    } else {
        return YES;
    }
}

- (void)resetAllUpTextField{
    [self.superview endEditing:YES];
    for (id subView in self.superview.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            
            [self resetWithUpTextField:subView];
           
        }
    }
}
#pragma mark - UITextFieldDelegate - 
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(upTextFieldDidEndEditing:)]) {
        [self.delegate upTextFieldDidEndEditing:self];
    }
}

//  开始编辑,处理父视图上所有的对象：输入框有内容的不变，没有内容的直接复位
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    //  遍历父视图的子视图数组，当满足其等于该类并且不是当前对象时，进行复位操作
    for (id subView in self.superview.subviews) {
        if ([subView isKindOfClass:[self class]] && ![subView isEqual:self]) {
            
            [self resetWithUpTextField:subView];
            
        }
    }
    
    //  上移占位文本
    [self upPlaceholer];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(upTextFieldShouldBeginEditing:textField:)]) {
        [self.delegate upTextFieldShouldBeginEditing:self textField:textField];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.superview endEditing:YES];
    [self resetAllUpTextField];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (self.isPhone) {
        if ([string isPhone] != PhoneTypeNo) {
            NSString *str = [NSString stringWithFormat:@"%@ %@ %@",[string substringWithRange:NSMakeRange(0, 3)],[string substringWithRange:NSMakeRange(3, 4)],[string substringWithRange:NSMakeRange(7, 4)]];
           textField.text = str;
            return NO;
        }
        NSUInteger newLength = textField.text.length - range.length + string.length;
        //添加
        if (string.length>0) {
            NSMutableString *str=[NSMutableString stringWithString:textField.text];
            
            while (textField.text.length == 3||textField.text.length == 8) {
                if (textField.text.length == 3) {
                    [str insertString:@" " atIndex:3];
                }else if(textField.text.length == 8){
                    [str insertString:@" " atIndex:8];
                }
                textField.text = [NSString stringWithString:str];
            }
            
        }
        //删除
        else if(string.length == 0){
            
            NSMutableString *str=[NSMutableString stringWithString:textField.text];
            while (textField.text.length == 5||textField.text.length == 10) {
                if (textField.text.length == 5) {
                    [str deleteCharactersInRange:NSMakeRange(4, 1)];
                }
                else if(textField.text.length == 10){
                    [str deleteCharactersInRange:NSMakeRange(9, 1)];
                }
                textField.text = [NSString stringWithString:str];
            }
        }
        // 限制输入长度为13.（分隔线也计算在内）
        if (newLength > 13)
            return NO;//限制长度
        return YES;
    } else {
        return YES;
    }
    
   
}

//  输入框内容修改
- (void)textFieldDidChange:(UITextField *)textField{
    NSString *toBeString = textField.text;
    
    BOOL isEmoj = [self stringContainsEmoji:toBeString];
    
    
    toBeString = [self disable_emoji:toBeString];
    
    
    if (isEmoj) {
        
        
        textField.text = toBeString;
        
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(upTextFieldChange:textField:)]) {
        [self.delegate upTextFieldChange:self textField:textField];
    }
}


//判断NSString字符串是否包含emoji表情
- (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue =NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800) {
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        returnValue =YES;
                    }
                }
            }else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    returnValue =YES;
                }
            }else {
                // non surrogate
                if (0x2100 <= hs && hs <= 0x27ff) {
                    returnValue =YES;
                }else if (0x2B05 <= hs && hs <= 0x2b07) {
                    returnValue =YES;
                }else if (0x2934 <= hs && hs <= 0x2935) {
                    returnValue =YES;
                }else if (0x3297 <= hs && hs <= 0x3299) {
                    returnValue =YES;
                }else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                    returnValue =YES;
                }
            }
        }
    }];
    return returnValue;
}

//禁止输入表情
- (NSString *)disable_emoji:(NSString *)text
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
