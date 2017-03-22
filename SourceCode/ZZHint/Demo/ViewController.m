//
//  ViewController.m
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ZZHintExtension.h"
#import "ZZHint.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *ctView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.75];
    
    UIView *ctView = [[UIView alloc] init];
    [self.view addSubview:ctView];
    ctView.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.8];
    ctView.frame = CGRectMake(40, 50, ZZScreenWidth - 80, ZZScreenHeight - 50 - 160);
    _ctView = ctView;
    ctView.layer.masksToBounds = YES;
    
    
    [self addButtonWithTitle:@"Window_Top" action:@selector(click0) index:0];
    [self addButtonWithTitle:@"Window_Middle" action:@selector(click1) index:1];
    [self addButtonWithTitle:@"Window_Bottom" action:@selector(click2) index:2];
    [self addButtonWithTitle:@"View_Top" action:@selector(click3) index:3];
    [self addButtonWithTitle:@"View_Middle" action:@selector(click4) index:4];
    [self addButtonWithTitle:@"View_Bottom" action:@selector(click5) index:5];

}

- (void)addButtonWithTitle:(NSString *)title action:(SEL)action index:(int)index {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:button];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    CGFloat btnWidth = ZZScreenWidth / 3;
    int row = index / 3;
    int col = index % 3;
    button.frame = CGRectMake(col * btnWidth, _ctView.maxY + 20 + (50 + 10) * row, btnWidth, 50);
}

- (void)click0 {
    [ZZHint show:@"Window_Top" type:ZZHintTypeTop];
}
- (void)click1 {
    [ZZHint show:@"Window_Middle" type:ZZHintTypeMiddle];
}
- (void)click2 {
    [ZZHint show:@"Window_Botton" type:ZZHintTypeBottom];
}
- (void)click3 {
    [ZZHint showIn:_ctView message:@"View_Top" type:ZZHintTypeTop];
}
- (void)click4 {
    [ZZHint showIn:_ctView message:@"View_Middle" type:ZZHintTypeMiddle];
}
- (void)click5 {
    [ZZHint showIn:_ctView message:@"View_Bottom" type:ZZHintTypeBottom];
}

@end
