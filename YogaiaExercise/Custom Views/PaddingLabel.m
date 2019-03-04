//
//  PaddingLabel.m
//  YogaiaExercise
//
//  Created by Trong Triet Le on 04/03/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

#import "PaddingLabel.h"

@implementation PaddingLabel

CGFloat const padding = 8.0;

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {padding, padding, padding, padding};
    self.layer.cornerRadius = 8;
    self.clipsToBounds = TRUE;
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

- (CGSize)intrinsicContentSize {
    CGSize size = super.intrinsicContentSize;
    return CGSizeMake(size.width + padding * 2 , size.height + padding * 2);
}

@end
