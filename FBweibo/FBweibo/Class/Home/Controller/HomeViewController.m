//
//  HomeViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/22.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomView.h"
#import <pop/POP.h>

@interface HomeViewController ()
@property (nonatomic, weak) CustomView *customV;
@end

@implementation HomeViewController

#pragma Mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self action:@selector(friendatTenttionAction) forNormalImage:@"navigationbar_friendattention_dot" forHighImage:@"navigationbar_friendattention_dot_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self action:@selector(radarAction) forNormalImage:@"navigationbar_icon_radar" forHighImage:@"navigationbar_icon_radar_highlighted"];
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame = CGRectMake(0, 0, 50, 30);
    [titleBtn setTitle:@"fengbin_superman"
              forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor colorWithRed:0.24 green:0.24 blue:0.24 alpha:1.00]
                   forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"]
              forState:UIControlStateNormal];

    [titleBtn addTarget:self action:@selector(buttonTouchDownAction:)
       forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [titleBtn addTarget:self action:@selector(buttonTouchUpInsideAction:)
       forControlEvents:UIControlEventTouchUpInside];
    
    titleBtn.adjustsImageWhenHighlighted = NO; // 去除点击是图片上的阴影
    titleBtn.backgroundColor = [UIColor whiteColor];
    titleBtn.layer.cornerRadius = 3.0;
    titleBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0, 6.0, 0.0, 6.0);
    titleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    titleBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
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
/**
 *  navigationItem titleView touchDown action handle
 */
- (void)buttonTouchDownAction:(UIButton *)sender {
    POPBasicAnimation *backgroundAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
    backgroundAnimation.toValue = [UIColor groupTableViewBackgroundColor];
    backgroundAnimation.duration = 0.3;
    [sender.layer pop_addAnimation:backgroundAnimation forKey:@"buttonLayerHighlightColor"];
}

/**
 *  navigationItem titleView touchUpInside action handle
 */
- (void)buttonTouchUpInsideAction:(UIButton *)sender {
    POPBasicAnimation *backgroundAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
    backgroundAnimation.toValue = [UIColor whiteColor];
    [sender.layer pop_addAnimation:backgroundAnimation forKey:@"buttonLayerNormalColor"];
    
    POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    rotationAnimation.toValue = @(M_PI);
    rotationAnimation.duration = 0.3;
    [sender.imageView.layer pop_addAnimation:rotationAnimation forKey:@"buttonImageViewRotation"];
}



@end
