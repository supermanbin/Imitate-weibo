//
//  CustomNavigationViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/23.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "CustomNavigationViewController.h"

@interface CustomNavigationViewController ()
@property (nonatomic, weak) UIVisualEffectView *visualEffectView;
@end

@implementation CustomNavigationViewController

+ (void)initialize {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
#if __IPHONE_OS_VERSION_MAX_ALLOWED > 80000
    // 设置毛玻璃效果
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualEffectView.layer.shadowColor = [UIColor blackColor].CGColor;
    visualEffectView.layer.shadowOffset = CGSizeMake(0, 0.f);
    visualEffectView.layer.shadowRadius = 1.5f;
    visualEffectView.layer.shadowOpacity = .1f;
    visualEffectView.frame = CGRectMake(0, -20.0f, self.view.width, 62.f);
    [self.navigationBar insertSubview:visualEffectView atIndex:0];
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
#endif
}

#pragma mark 复写pushViewController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
//    FBLog(@"%ld %@", self.viewControllers.count, viewController);
    // 打印系统版本号的字符串
    // FBLog(@"%@", [[UIDevice currentDevice] systemVersion]);
    // 值等于Base SDK，即用于检查SDK版本的
    // FBLog(@"%d", __IPHONE_OS_VERSION_MAX_ALLOWED);
    // ployment Target，检查支持的最小系统版本
    // FBLog(@"%d", __IPHONE_OS_VERSION_MIN_REQUIRED);
    
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self action:@selector(back) forNormalImage:@"navigationbar_back_withtext" forHighImage:@"navigationbar_back_withtext_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)listSubviewsOfView:(UIView *)view {
    
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    
    // Return if there are no subviews
    if ([subviews count] == 0) return; // COUNT CHECK LINE
    
    for (UIView *subview in subviews) {
        
        // Do what you want to do with the subview
        FBLog(@"%@", subview);
        
        // List the subviews of subview
        [self listSubviewsOfView:subview];
    }
}
@end
