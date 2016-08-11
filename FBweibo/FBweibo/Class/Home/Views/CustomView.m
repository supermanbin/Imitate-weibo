//
//  CustomView.m
//  FBweibo
//
//  Created by 封斌 on 16/8/11.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
@property (nonatomic, weak) UILabel *label;
@end

@implementation CustomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14.f];
        label.text = @"custom view";
        [self addSubview:label];
        self.label = label;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 24.f);
}
@end
