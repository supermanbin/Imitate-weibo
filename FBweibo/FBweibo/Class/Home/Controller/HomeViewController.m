//
//  HomeViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/22.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "HomeViewController.h"
#import "NavigationItemTitleViewButton.h"
#import "DropMenuView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma Mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem navigationItemAddTarget:self
                                      action:@selector(friendatTenttionAction)
                              forNormalImage:@"navigationbar_friendattention_dot"
                                forHighImage:@"navigationbar_friendattention_dot_highlighted"];
    
    self.navigationItem.rightBarButtonItem =
    [UIBarButtonItem navigationItemAddTarget:self
                                      action:@selector(radarAction)
                              forNormalImage:@"navigationbar_icon_radar"
                                forHighImage:@"navigationbar_icon_radar_highlighted"];
    
    NavigationItemTitleViewButton *titleBtn = [NavigationItemTitleViewButton button];
    [titleBtn setTitle:@"fengbin_superman"
              forState:UIControlStateNormal];
    [titleBtn addTarget:self
                 action:@selector(buttonTouchUpInsideAction:)
       forControlEvents:UIControlEventTouchUpInside];
    titleBtn.frame = CGRectMake(0, 0, 50, 30);
    self.navigationItem.titleView = titleBtn;
    
}

#pragma Mark - Custom Accessores


#pragma Mark - Private Method
- (void)friendatTenttionAction {
    FBLog(@"friendatTenttionAction !!!!");
}

- (void)radarAction {
    FBLog(@"radarAction !!!!");
}

#pragma Mark - Button Action
- (void)buttonTouchUpInsideAction:(UIButton *)sender {
    DropMenuView *menu = [DropMenuView menu];
    [menu showMenu];
}



@end
