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
@property (nonatomic, weak) UIView *arrowView;
@end

@implementation DropMenuView
/**
 *  Singleton
 */
static DropMenuView *shareView = nil;

+ (instancetype)shareDropView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareView = [[super allocWithZone:NULL] init];
    });
    return shareView;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [DropMenuView shareDropView];
}

- (instancetype)copyWithZone:(struct _NSZone *)zone {
    return [DropMenuView shareDropView];
}

#pragma Mark - Public Class Method

+ (void)dismiss {
    [[self shareDropView] dismissFormWindow];
}

#pragma Mark - Private Method
- (void)showFrom:(UIView *)fromView {
    // 获取最顶层window
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    window.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissFormWindow)];
    [window addGestureRecognizer:tapGesture];
    
    self.frame = window.bounds;
    [window addSubview:self];
    
    // 坐标转换
    CGRect rect = [fromView.superview convertRect:fromView.frame toView:nil];
    FBLog(@"%@", NSStringFromCGRect(rect));
    self.contentWrapView.y = CGRectGetMaxY(rect)+6.0;
    self.contentWrapView.centerX = CGRectGetMidX(rect);
    
    FBLog(@"rect:::%f, contentWrapView::%f", CGRectGetMidX(rect), self.contentWrapView.centerX);
    
}

- (void)dismissFormWindow {
    [self.content removeFromSuperview];
    [self.contentWrapView removeFromSuperview];
    [self removeFromSuperview];
}

#pragma Mark - Initialization
+ (instancetype)menu {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0
                                               green:0
                                                blue:0
                                               alpha:0.2];
        _arrowDistence = 10.f;
    }
    return self;
}

#pragma mark - Custom Accessors
- (UIView *)contentWrapView {
    if (!_contentWrapView) {
        UIView *contentWrapView = [[UIView alloc] init];
        contentWrapView.backgroundColor = [UIColor whiteColor];
        contentWrapView.layer.cornerRadius = 6.0;
        contentWrapView.layer.shadowColor = [UIColor blackColor].CGColor;
        contentWrapView.layer.shadowOffset = CGSizeMake(0.0, 3.0);
        contentWrapView.layer.shadowRadius = 2.0;
        contentWrapView.layer.shadowOpacity = 0.2;
        [self addSubview:contentWrapView];
        _contentWrapView = contentWrapView;
    }
    return _contentWrapView;
}

- (UIView *)arrowView {
    if (!_arrowView) {
        UIView *arrowView = [[UIView alloc] init];
        arrowView.backgroundColor = [UIColor whiteColor];
        arrowView.height = 10.0;
        arrowView.width = 10.0;
        arrowView.y = -4.0;
        arrowView.transform = CGAffineTransformMakeRotation(M_PI_4);
        [self.contentWrapView addSubview:arrowView];
        _arrowView = arrowView;
    }
    return _arrowView;
}

- (void)setContent:(UIView *)content {
    content.x = 10;
    content.y = 10;
    self.contentWrapView.width = CGRectGetWidth(content.frame) + 20;
    self.contentWrapView.height = CGRectGetHeight(content.frame) + 20;
    [self.contentWrapView addSubview:content];
    self.arrowView.centerX = content.centerX;
}

- (void)setController:(UIViewController *)controller {
    self.content = controller.view;
}

@end
