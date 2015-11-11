//
//  UIColor+Hex.m
//  FGGTextField
//
//  Created by 夏桂峰 on 15/11/11.
//  Copyright © 2015年 夏桂峰. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+(UIColor *)colorWithHex:(UInt32)hex
{
    CGFloat b=(hex&0xFF)/255.f;
    CGFloat g=((hex>>8)&0xFF)/255.f;
    CGFloat r=((hex>>16)&0xFF)/255.f;
    CGFloat a=hex>0xFFFFFF?((hex>>24)&0xFF)/255.f:1.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
