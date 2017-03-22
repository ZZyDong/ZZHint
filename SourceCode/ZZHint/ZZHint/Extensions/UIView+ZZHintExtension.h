//
//  UIView+ZZHintExtension.h
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZZScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZZScreenHeight [UIScreen mainScreen].bounds.size.height

@interface UIView (ZZHintExtension)

- (void)makeCornerWithRadius:(float)radius;


- (CGFloat)x;
- (CGFloat)y;
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (CGFloat)maxX;
- (CGFloat)maxY;
- (CGFloat)centerX;
- (CGFloat)centerY;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;

@end
