//
//  BouncePresentAnimation.m
//  FBweibo
//
//  Created by 封斌 on 16/8/17.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 1、从transitionContext获取UIViewController
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2、给toVC设置frame
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    CGRect animationEndRect = [transitionContext finalFrameForViewController:toVC];
    // 设置toVC的frame动画开始前的初始状态
    toVC.view.frame = CGRectOffset(animationEndRect, 0, mainRect.size.height);
    
    // 3、把toVC的view添加到containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4、设置动画
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.view.frame = animationEndRect;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
    
}
@end
