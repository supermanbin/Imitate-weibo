//
//  DropMenuView.m
//  FBweibo
//
//  Created by 封斌 on 16/8/13.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "DropMenuView.h"
#import <pop/POP.h>

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
    self.frame = window.bounds;
    [window addSubview:self];
    
    // 坐标转换
    CGRect rect = [window convertRect:fromView.bounds fromView:fromView];
    self.contentWrapView.y = CGRectGetMaxY(rect)+6.0;
    self.contentWrapView.centerX = CGRectGetMidX(rect);
    
    if ([self.delegate respondsToSelector:@selector(dropMenuDidShow:)]) {
        [self.delegate dropMenuDidShow:self];
    }
}

- (void)dismissFormWindow {
    [self.content removeFromSuperview];
    [self.contentWrapView removeFromSuperview];
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissFormWindow];
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
                                               alpha:0.3];
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
        self.contentWrapView = contentWrapView;
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
        [self.contentWrapView insertSubview:arrowView atIndex:0];
        self.arrowView = arrowView;
    }
    return _arrowView;
}

- (void)setContent:(UIView *)content {
    _content = content;
    content.x = 5.0;
    content.y = 5.0;
    
    self.arrowView.centerX = content.centerX;
    self.contentWrapView.width = CGRectGetWidth(content.frame) + 10.0;
    self.contentWrapView.height = CGRectGetHeight(content.frame) + 10.0;
    [self.contentWrapView addSubview:content];
    [self setAnchorPoint:CGPointMake(0.5, 0.0) forView:self.contentWrapView];
    
    // 动画
//    POPSpringAnimation *contentWrapViewAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//    contentWrapViewAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(1.5, 1.5)];
//    contentWrapViewAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
//    contentWrapViewAnimation.springBounciness = 18.0;
//    [self.contentWrapView pop_addAnimation:contentWrapViewAnimation
//                                          forKey:@"contentWrapViewAnimation"];
    
}

- (void)setController:(UIViewController *)controller {
    _controller = controller;
    
    self.content = controller.view;
}

- (void) setAnchorPoint:(CGPoint)anchorpoint forView:(UIView *)view{
    CGRect oldFrame = view.frame;
    view.layer.anchorPoint = anchorpoint;
    view.frame = oldFrame;
}
@end
