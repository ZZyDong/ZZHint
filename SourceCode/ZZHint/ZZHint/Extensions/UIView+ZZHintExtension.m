//
//  UIView+ZZHintExtension.m
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "UIView+ZZHintExtension.h"


@implementation UIView (ZZHintExtension)

- (void)makeCornerWithRadius:(float)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y  ;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

@end
