//
//  RootViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/21.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "MessagesViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "ComposeViewController.h"
#import "CustomNavigationViewController.h"
#import "ComposeTabBar.h"

@interface RootViewController ()<ComposeTabBarDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 3、创建子控制器
    HomeViewController *homeViewControl = [[HomeViewController alloc] init];
    [self addChildViewController:homeViewControl
                       withTitle:@"首页"
             withNormalImageName:@"tabbar_home"
             withSelectImageName:@"tabbar_home_selected"];
    
    MessagesViewController *messagesViewControl = [[MessagesViewController alloc] init];
    [self addChildViewController:messagesViewControl
                       withTitle:@"消息"
             withNormalImageName:@"tabbar_message_center"
             withSelectImageName:@"tabbar_message_center_selected"];
    
    DiscoverViewController *discoveryViewControl = [[DiscoverViewController alloc] init];
    [self addChildViewController:discoveryViewControl
                       withTitle:@"发现"
             withNormalImageName:@"tabbar_discover"
             withSelectImageName:@"tabbar_discover_selected"];
    
    MineViewController *mineViewControl = [[MineViewController alloc] init];
    [self addChildViewController:mineViewControl
                       withTitle:@"我"
             withNormalImageName:@"tabbar_profile"
             withSelectImageName:@"tabbar_profile_selected"];
    
    [self setValue:[[ComposeTabBar alloc] init] forKeyPath:@"tabBar"];
    
    
}

#pragma mark 添加子控制器
/**
 *  添加子控制器
 *
 *  @param childViewController 子控制器
 *  @param title          子控制器title
 *  @param normalImage    tabbar普通图片
 *  @param selectImage    tabbar选中图片
 */
- (void)addChildViewController:(UIViewController *)childViewController
                     withTitle:(NSString *) title
           withNormalImageName:(NSString *)normalImageName
           withSelectImageName:(NSString *)selectImageName {
    // 设置标题
    childViewController.title = title;
    // 
    [childViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    // 普通状态
    [childViewController.tabBarItem setImage:[UIImage imageNamed:normalImageName]];
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: RGBCOLOR(0X666666, 1.0)}
                                             forState:UIControlStateNormal];
    // 选中状态
    UIImage *tempImg = [UIImage imageNamed:selectImageName];
    [childViewController.tabBarItem setSelectedImage:[tempImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: RGBCOLOR(0XFD8224, 1.0)}
                                             forState:UIControlStateSelected];
    
    CustomNavigationViewController *nav = [[CustomNavigationViewController alloc] initWithRootViewController:childViewController];
    
    [self addChildViewController:nav];
}

#pragma mark composeTabBarDelegate
- (void)composeTabBarClickAction {
    ComposeViewController *composeVC = [[ComposeViewController alloc] init];
    [self presentViewController:composeVC animated:YES completion:^{
        FBLog(@"present view controller success!!");
    }];
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    window.backgroundColor = [UIColor blueColor];
//    [window makeKeyAndVisible];
}

#pragma mark 设置tabbar高度
/**
 * 设置tabbar高度
 */
- (void)viewWillLayoutSubviews {
//    CGRect tabFrame = self.tabBar.frame;
//    tabFrame.size.height = 46;
//    tabFrame.origin.y = self.view.frame.size.height - 46;
//    self.tabBar.frame = tabFrame;
    self.tabBar.y = self.view.height - 46.f;
    self.tabBar.height = 46.f;
    
}

@end
