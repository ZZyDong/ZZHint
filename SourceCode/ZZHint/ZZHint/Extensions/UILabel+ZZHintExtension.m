//
//  UILabel+ZZHintExtension.m
//  ZZHint
//
//  Created by Zhang_yD on 2017/3/22.
//  Copyright © 2017年 Z. All rights reserved.
//

#import "UILabel+ZZHintExtension.h"

@implementation UILabel (ZZHintExtension)

- (CGSize)labelSize {
    return  [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
}

- (CGFloat)labelWidth {
    return self.labelSize.width;
}
- (CGFloat)labelHeight {
    return self.labelSize.height;
}

@end
