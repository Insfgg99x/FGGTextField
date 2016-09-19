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

- (void)viewDidLoad{
    
    [super viewDidLoad];
    FGGTextField *tf=[[FGGTextField alloc]initWithFrame:CGRectMake(10, 100, kWidth-20, 40)];
    tf.placeholder=@"请输入邮箱";
    tf.errorText=@"邮箱格式不对";
    tf.validatorText=@"邮箱";
    [self.view addSubview:tf];
    tf.borderStyle=UITextBorderStyleRoundedRect;
    tf.keyboardType=UIKeyboardTypeEmailAddress;
    
    
    UILabel *leftView=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    leftView.textAlignment=NSTextAlignmentCenter;
    tf.leftView=leftView;
    tf.adjustsFontSizeToFitWidth=YES;
    tf.leftViewMode=UITextFieldViewModeAlways;
    leftView.text=@"😐";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeAction:) name:UITextFieldTextDidChangeNotification object:tf];
    
    AJWValidator *validator=[AJWValidator validatorWithType:AJWValidatorTypeString];
    [validator addValidationToEnsureValidEmailWithInvalidMessage:tf.errorText];
    [tf ajw_attachValidator:validator];
    __weak typeof(validator) weak_validator=validator;
        validator.validatorStateChangedHandler=^(AJWValidatorState state){
            
            switch (state) {
                case AJWValidatorValidationStateValid:
                    tf.highlightState=FGGTextFieldHighlightStateValidator;
                    leftView.text=@"😁";
                    break;
                case AJWValidatorValidationStateInvalid:
                    tf.highlightState=FGGTextFieldHighlightStateWrong;
                    leftView.text=@"😟";
                    break;
                default:
                    break;
            }
            if(weak_validator.isValid){
                
                NSLog(@"格式正确✅");
            }
        };
}
-(void)textDidChangeAction:(NSNotification *)sender{
    
    
    UITextField *tf=sender.object;
    UILabel *leftView=(UILabel *)tf.leftView;
    if(tf.text.length==0){
        leftView.text=@"😐";
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
