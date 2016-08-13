//
//  DropMenuView.m
//  FBweibo
//
//  Created by 封斌 on 16/8/13.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "DropMenuView.h"

@interface DropMenuView ()

@end

@implementation DropMenuView

+ (instancetype)menu {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor blueColor];
        [self.window addSubview:backgroundView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)showMenu {
    // 获取最顶层window
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    
    self.frame = window.bounds;
    [window addSubview:self];
}

- (void)dismiss {
    
}
@end
