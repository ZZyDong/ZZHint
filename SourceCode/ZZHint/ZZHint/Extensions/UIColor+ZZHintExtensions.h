//
//  UIColor+ZZHintExtensions.h
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZColor(hex) [UIColor colorWithHex:hex]

@interface UIColor (ZZHintExtensions)

+ (UIColor *)colorWithHex:(NSInteger)hexValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

@end

