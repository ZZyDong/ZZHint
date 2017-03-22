//
//  ZZHint.m
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "ZZHint.h"
#import "UIView+ZZHintExtension.h"
#import "UIColor+ZZHintExtensions.h"
#import "UILabel+ZZHintExtension.h"

static const NSInteger hintTag = 9096;

@interface ZZHint ()
@property (nonatomic, weak) UIView *spView;
@property (nonatomic, weak) UILabel *hintLabel;
@end

@interface ZZHint (Private)
- (void)zp_showIn:(UIView *)spView message:(NSString *)message type:(ZZHintType)type style:(ZZHintStyle)style;
- (void)zp_setup;
- (void)zp_showAnimation;
@end

@implementation ZZHint
{
    NSString *_message;
    ZZHintType _type;
    ZZHintStyle _style;
}

+ (void)show:(NSString *)message {
    [self showIn:nil message:message type:0 style:0];
}
+ (void)show:(NSString *)message type:(ZZHintType)type {
    [self showIn:nil message:message type:type style:0];
}
+ (void)show:(NSString *)message type:(ZZHintType)type style:(ZZHintStyle)style {
    [self showIn:nil message:message type:type style:style];
}

+ (void)showIn:(UIView *)view message:(NSString *)message {
    [self showIn:view message:message type:0 style:0];
}
+ (void)showIn:(UIView *)view message:(NSString *)message type:(ZZHintType)type {
    [self showIn:view message:message type:type style:0];
}
+ (void)showIn:(UIView *)view message:(NSString *)message type:(ZZHintType)type style:(ZZHintStyle)style {
    UIView *rtView = view ? view : [UIApplication sharedApplication].keyWindow;
    if ([rtView viewWithTag:hintTag]) return;
    ZZHint *hint = [[self alloc] init];
    [hint zp_showIn:view message:message type:type style:style];
}


@end

@implementation ZZHint (Private)

- (void)zp_showIn:(UIView *)spView message:(NSString *)message type:(ZZHintType)type style:(ZZHintStyle)style {
    _spView = spView;
    _message = message;
    _type = type;
    _style = style;
    self.tag = hintTag;
    [self zp_setup];
    if (_spView) {
        [_spView addSubview:self];
    } else {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    [self zp_showAnimation];
}

- (void)zp_setup {
    if (_type == ZZHintTypeTop) {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = CGRectMake(0, -100, ZZScreenWidth, 100);
        
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = ZColor(0x111111);
        label.text = _message;
        _hintLabel = label;
    } else {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        self.alpha = 0;
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.font = [UIFont systemFontOfSize:14];
        label.text = _message;
        label.textColor = [UIColor whiteColor];
        label.frame = CGRectMake(0, 0, label.labelWidth + 36, label.labelHeight + 22);
        label.textAlignment = NSTextAlignmentCenter;
        _hintLabel = label;
        
        self.width = label.width;
        self.height = label.height;
        [self makeCornerWithRadius:self.height / 2];
    }
}

- (void)zp_showAnimation {
    
    switch (_type) {
        case ZZHintTypeTop:
        {
            float distance;
            if (_spView) {
                distance = 40;
                self.frame = CGRectMake(0, -100, _spView.width, 100);
            } else {
                distance = 64;
                self.frame = CGRectMake(0, -100, ZZScreenWidth, 100);
            }
            _hintLabel.frame = CGRectMake(20, self.height - 10 - _hintLabel.labelHeight, self.width - 40, _hintLabel.labelHeight);
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.transform = CGAffineTransformMakeTranslation(0, distance);
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.transform = CGAffineTransformIdentity;
                    } completion:^(BOOL finished) {
                        [self removeFromSuperview];
                    }];
                });
            }];
        }
            break;
        case ZZHintTypeMiddle:
        {
            if (_spView) {
                self.center = CGPointMake(_spView.width / 2, _spView.height / 2);
            } else {
                self.center = CGPointMake(ZZScreenWidth / 2, ZZScreenHeight / 2);
            }
            [UIView animateWithDuration:0.3 animations:^{
                self.alpha = 1;
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.alpha = 0;
                    } completion:^(BOOL finished) {
                        [self removeFromSuperview];
                    }];
                });
            }];
        }
            break;
        case ZZHintTypeBottom:
        {
            if (_spView) {
                self.centerX = _spView.width / 2;
                self.y = _spView.height - 20 - self.height;
            } else {
                self.centerX = ZZScreenWidth / 2;
                self.y = ZZScreenHeight - 25 - self.height;
            }
            
            [UIView animateWithDuration:0.3 animations:^{
                self.alpha = 1;
                self.transform = CGAffineTransformMakeTranslation(0, -15);
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.transform = CGAffineTransformIdentity;
                        self.alpha = 0;
                    } completion:^(BOOL finished) {
                        [self removeFromSuperview];
                    }];
                });
            }];
        }
            break;
    }
}


@end
