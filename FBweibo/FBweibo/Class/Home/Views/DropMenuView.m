//
//  DropMenuView.m
//  FBweibo
//
//  Created by 封斌 on 16/8/13.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "DropMenuView.h"

@interface DropMenuView ()
@property (nonatomic, weak) UIView *contentWrapView;
@end

@implementation DropMenuView

+ (instancetype)menu {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0
                                               green:0
                                                blue:0
                                               alpha:0.3];
        
        // 内容容器
        UIView *contentWrapView = [[UIView alloc] init];
        contentWrapView.backgroundColor = [UIColor whiteColor];
        contentWrapView.frame = CGRectMake(0, 0, 100, 100);
        [self addSubview:contentWrapView];
        self.contentWrapView = contentWrapView;
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//}

- (void)showMenu {
    // 获取最顶层window
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    
    self.frame = window.bounds;
    [window addSubview:self];
}

- (void)dismiss {
    [self removeFromSuperview];
}
@end
