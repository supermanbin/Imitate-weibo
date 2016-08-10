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
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setTitle:@"fengbin_superman"
              forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor colorWithRed:0.24 green:0.24 blue:0.24 alpha:1.00]
                   forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"]
              forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"]
              forState:UIControlStateSelected];
    
    titleBtn.frame = CGRectMake(0, 0, 120, 30);
    titleBtn.selected = YES;
    titleBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    CGSize imageSize = titleBtn.currentImage.size;
    CGSize titleSize = titleBtn.titleLabel.frame.size;
//    titleBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, 0);
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, 0);
    titleBtn.imageView.backgroundColor = [UIColor lightGrayColor];
    titleBtn.titleLabel.backgroundColor = [UIColor lightTextColor];
//    titleBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    titleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    titleBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.navigationItem.titleView = titleBtn;
}

- (void)friendatTenttionAction {
    FBLog(@"friendatTenttionAction !!!!");
}

- (void)radarAction {
    FBLog(@"radarAction !!!!");
}

@end
