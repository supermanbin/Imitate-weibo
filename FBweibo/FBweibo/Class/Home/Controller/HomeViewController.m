//
//  HomeViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/22.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self action:@selector(friendatTenttionAction) forNormalImage:@"navigationbar_friendattention_dot" forHighImage:@"navigationbar_friendattention_dot_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self action:@selector(radarAction) forNormalImage:@"navigationbar_icon_radar" forHighImage:@"navigationbar_icon_radar_highlighted"];
    
//    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    titleBtn.frame = CGRectMake(0, 0, 120, 30);
//    titleBtn.backgroundColor = [UIColor grayColor];
//    [titleBtn setTitle:@"fengbinsuperman" forState:UIControlStateNormal];
//    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
//    self.navigationItem.titleView = titleBtn;
}

- (void)friendatTenttionAction {
    FBLog(@"friendatTenttionAction !!!!");
}

- (void)radarAction {
    FBLog(@"radarAction !!!!");
}

@end
