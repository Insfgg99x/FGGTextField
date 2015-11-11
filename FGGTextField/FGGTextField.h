//
//  FGGTextField.h
//  FGGTextField
//
//  Created by 夏桂峰 on 15/11/10.
//  Copyright (c) 2015年 夏桂峰. All rights reserved.
//
/*
 FGGTextField简介
----------------------------------------------------------------
FGGTextField继承自UITextField，依赖第三方库AJWValidator，
用于实现文本框输入文本的实时监测，酷炫简介的提示效果。
声明：FGGTextField借鉴了一个名为UITextBox的Swift的库

用法简介：
---------------------------------------------------------------
1.在项目中导入：FGGTextField.h
2.创建FGGTextField的对象
  FGGTextField *tf=[[FGGTextField alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];
3.设置属性
 tf.placeholder=@"请输入邮箱";
 tf.errorText=@"邮箱格式不正确";
 tf.validatorText=@"邮箱";
 
 tf.borderStyle=UITextBorderStyleRoundedRect;
 tf.keyboardType=UIKeyboardTypeEmailAddress;
4.添加到父视图
 ***********************************
 *注意:一定要在设置属性之后再添加到父视图*
 ***********************************
 [self.view addSubview:tf];
 不要问为啥要后添加到父视图，我也很想解决这个问题，你就当是一个bug呗-.-
 如果找到好的解决办法，欢迎pull request，repository地址是：
 https://github.com/Insfgg99x/FGGTextField.git
 或者发给我发邮件：newbox0512@yahoo.com
 
 ©夏桂峰
----------------------------------------------------------------
 */

#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"
#import "AJWValidator.h"

#define wrongColor      [UIColor colorWithHex:0xFFEEEE]// 淡红色
#define warningColor    [UIColor colorWithHex:0xFFFFCC]// 淡黄色
#define validatorColor  [UIColor colorWithHex:0xEEFFEE]// 淡绿色
#define highlightColor  [UIColor colorWithHex:0xEEF7FF]// 淡蓝色
#define animateDuration 0.4


typedef NS_ENUM(NSInteger,FGGTextFieldHighlightState){
    
    FGGTextFieldHighlightStateDefault,  // 默认提示文字
    FGGTextFieldHighlightStateValidator,// 格式正确状态提示文字
    FGGTextFieldHighlightStateWarning,  // 警告状态提示文字
    FGGTextFieldHighlightStateWrong,    // 错误状态提示文字
};

@interface FGGTextField : UITextField


@property (nonatomic,strong)UILabel *placeHolderLabel;

@property (nonatomic,copy)NSString *defaultText;
@property (nonatomic,copy)NSString *validatorText;
@property(nonatomic,copy)NSString *warningText;
@property(nonatomic,copy)NSString *errorText;

@property (nonatomic,assign)FGGTextFieldHighlightState highlightState;

@end
