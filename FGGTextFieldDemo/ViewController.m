//
//  ViewController.m
//  FGGTextFieldDemo
//
//  Created by 夏桂峰 on 15/11/10.
//  Copyright (c) 2015年 夏桂峰. All rights reserved.
//

#import "ViewController.h"
#import "FGGTextField.h"

#define kWidth ([UIScreen mainScreen].bounds.size.width)
#define kHeight ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FGGTextField *tf=[[FGGTextField alloc]initWithFrame:CGRectMake(50, 100, kWidth-100, 40)];
    tf.placeholder=@"请输入邮箱";
    tf.errorText=@"邮箱格式不正确";
    tf.validatorText=@"邮箱";
    [self.view addSubview:tf];
    tf.borderStyle=UITextBorderStyleRoundedRect;
    tf.keyboardType=UIKeyboardTypeEmailAddress;
    
    AJWValidator *validator=[AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureValidEmailWithInvalidMessage:tf.errorText];
    [tf ajw_attachValidator:validator];
    __weak typeof(validator) weak_validator=validator;
        validator.validatorStateChangedHandler=^(AJWValidatorState state){
            switch (state) {
                case AJWValidatorValidationStateValid:
                    tf.highlightState=FGGTextFieldHighlightStateValidator;
                    break;
                case AJWValidatorValidationStateInvalid:
                    tf.highlightState=FGGTextFieldHighlightStateWrong;
                    break;
                default:
                    break;
            }
            if(weak_validator.isValid)
            {
                NSLog(@"格式正确✅");
            }
        };
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
