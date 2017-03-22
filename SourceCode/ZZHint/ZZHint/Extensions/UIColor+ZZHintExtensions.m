//
//  UIColor+ZZHintExtensions.m
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "UIColor+ZZHintExtensions.h"

@implementation UIColor (ZZHintExtensions)

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    return [self colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [self colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                        green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                         blue:((float)(hexValue & 0xFF)) / 255.0 alpha:alphaValue];
}

@end
