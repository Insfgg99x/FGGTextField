//
//  FGGTextField.m
//  FGGTextField
//
//  Created by 夏桂峰 on 15/11/10.
//  Copyright (c) 2015年 夏桂峰. All rights reserved.
//

#import "FGGTextField.h"

@interface FGGTextField()
{
    FGGTextFieldHighlightState _highlightState;
}

@end

@implementation FGGTextField
{
    UIColor *_backgroundColor;
}

//highlightState的get方法
-(FGGTextFieldHighlightState)highlightState
{
    if(self.text==nil||self.text.length==0)
        return FGGTextFieldHighlightStateDefault;
    else
        return _highlightState;
}
//highlightState的set方法
-(void)setHighlightState:(FGGTextFieldHighlightState)state
{
    _highlightState=state;
    if(_placeHolderLabel)
    {
        [self setHighlightText:_placeHolderLabel state:self.highlightState];
        [self layoutSubviews];
    }
    [UIView animateWithDuration:animateDuration animations:^{
        super.backgroundColor=[self getHighlightColorFromState:self.highlightState];
    }];
}
//backgroundColor的set方法
-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    super.backgroundColor=[self getHighlightColorFromState:self.highlightState];
}
//attributedPlaceholder的set方法
-(void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
    [super setAttributedPlaceholder:attributedPlaceholder];
    if(_placeHolderLabel)
    {
        _placeHolderLabel.attributedText=super.attributedPlaceholder;
        [self layoutSubviews];
    }
}
//placeholder的set方法
-(void)setPlaceholder:(NSString *)placeholder
{
    self.defaultText=placeholder;
    if(_placeHolderLabel)
    {
        _placeHolderLabel.text=placeholder;
        [self layoutSubviews];
    }
}
//调整子控件布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect rect=[super placeholderRectForBounds:self.bounds];
    if([self isFirstResponder])
        [self layoutPlaceholderLabel:rect left:NO];
    else if(self.text==nil||self.text.length==0)
        [self layoutPlaceholderLabel:rect left:YES];
    else
        [self layoutPlaceholderLabel:rect left:NO];
}
//布局提示文本
-(void)layoutPlaceholderLabel:(CGRect)rect left:(BOOL)left
{
    if(!_placeHolderLabel)
        return;
    if(left)
    {
        [UIView animateWithDuration:animateDuration delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _placeHolderLabel.frame=rect;
        } completion:nil];
    }
    else
    {
        CGSize size=[_placeHolderLabel sizeThatFits:rect.size];
        CGRect frame=rect;
        frame.size.width=size.width;
        frame.size.height=CGRectGetHeight(rect);
        frame.origin.x=CGRectGetMinX([super clearButtonRectForBounds:self.bounds])-size.width;
        [UIView animateWithDuration:animateDuration delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _placeHolderLabel.frame=frame;
        } completion:nil];
    }
}
//获得焦点时高亮动画
-(BOOL)becomeFirstResponder
{
    return [self animationFirstResponder:[super becomeFirstResponder]];
}
//失去焦点时取消高亮动画
-(BOOL)resignFirstResponder
{
    return [self animationFirstResponder:[super resignFirstResponder]];
}
-(BOOL)animationFirstResponder:(BOOL)isFirstResponder
{
    [UIView animateWithDuration:animateDuration animations:^{
        UIColor *color=[self getHighlightColorFromState:self.highlightState];
        super.backgroundColor=color;
        _placeHolderLabel.textColor=[self getTextColorWithHighlightColor:color];
    }];
    return [self isFirstResponder];
}
// 同类颜色加深一些
-(UIColor *)getTextColorWithHighlightColor:(UIColor *)color
{
    CGFloat r=0.0;
    CGFloat g=0.0;
    CGFloat b=0.0;
    CGFloat a=0.0;
    [color getRed:&r green:&g blue:&b alpha:&a];
    return [UIColor colorWithRed:0.7*r*r green:0.7*g*g blue:0.7*b*b alpha:0.7*a];
}
//根据状态获取颜色
-(UIColor *)getHighlightColorFromState:(FGGTextFieldHighlightState)state
{
    switch (state){
    case FGGTextFieldHighlightStateWrong:
            return wrongColor;
            break;
    case FGGTextFieldHighlightStateWarning:
            return warningColor;
            break;
    case FGGTextFieldHighlightStateValidator:
            return validatorColor;
            break;
    default:
            return [self isFirstResponder] ? highlightColor : self.backgroundColor;//?? [UIColor whiteColor];
    }
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if(!_placeHolderLabel)
    {
        CGRect rect=[super placeholderRectForBounds:self.bounds];
        _placeHolderLabel=[[UILabel alloc]initWithFrame:rect];
        _placeHolderLabel.font=self.font;
        _placeHolderLabel.textColor=[UIColor lightGrayColor];
        [self setHighlightText:_placeHolderLabel state:self.highlightState];
        [self addSubview:_placeHolderLabel];
    }
}
-(void)setHighlightText:(UILabel *)label state:(FGGTextFieldHighlightState)state
{
    switch (state) {
        case FGGTextFieldHighlightStateDefault:
            label.textColor=[self getTextColorWithHighlightColor:self.textColor];
            label.text=self.defaultText;
            label.textColor=[UIColor lightGrayColor];
            break;
        case FGGTextFieldHighlightStateWrong:
            label.textColor=[self getTextColorWithHighlightColor:wrongColor];
            label.text=self.errorText;
            break;
        case FGGTextFieldHighlightStateWarning:
            label.textColor=[self getTextColorWithHighlightColor:warningColor];
            label.text=self.warningText;
            break;
        case FGGTextFieldHighlightStateValidator:
            label.textColor=[self getTextColorWithHighlightColor:validatorColor];
            label.text=self.validatorText;
            break;
        default:
            if(self.attributedPlaceholder)
            {
                label.attributedText=self.attributedPlaceholder;
            }
            else
                label.text=self.defaultText;
            label.textColor=[self getTextColorWithHighlightColor:[self getHighlightColorFromState:+_highlightState]];
            break;
    }
}


@end
