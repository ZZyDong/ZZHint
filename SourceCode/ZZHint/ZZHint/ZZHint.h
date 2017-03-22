//
//  ZZHint.h
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZZHintType) {
    ZZHintTypeMiddle = 0,
    ZZHintTypeTop,
    ZZHintTypeBottom
};

typedef NS_ENUM(NSUInteger, ZZHintStyle) {
    ZZHintStyleDefault = 0,
    ZZHintStyleBlack,
    ZZHintStyleWhite
};

@interface ZZHint : UIView

+ (void)show:(NSString *)message;
+ (void)show:(NSString *)message type:(ZZHintType)type;
+ (void)show:(NSString *)message type:(ZZHintType)type style:(ZZHintStyle)style;

+ (void)showIn:(UIView *)view message:(NSString *)message;
+ (void)showIn:(UIView *)view message:(NSString *)message type:(ZZHintType)type;
+ (void)showIn:(UIView *)view message:(NSString *)message type:(ZZHintType)type style:(ZZHintStyle)style;


@end
