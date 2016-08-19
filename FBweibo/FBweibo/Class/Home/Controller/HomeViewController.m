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
#import "TestTableViewController.h"
#import "ModalViewController.h"
#import "BouncePresentAnimation.h"
#import <Masonry.h>

@interface HomeViewController ()
<DropMenuViewDelegate,
ModalViewControllerDelegate,
UIViewControllerTransitioningDelegate>
@property (nonatomic, weak) DropMenuView *menu;
@property (nonatomic, strong) TestTableViewController *testVC;

@property (nonatomic, strong) BouncePresentAnimation *animation;
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
                 action:@selector(clickButtonPushModalVC)
       forControlEvents:UIControlEventTouchUpInside];
    titleBtn.frame = CGRectMake(0, 0, 50, 30);
    self.navigationItem.titleView = titleBtn;
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(100);
    }];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view1 addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view1).with.insets(UIEdgeInsetsMake(10.0,
                                                               10.0,
                                                               10.0,
                                                               10.0));
    }];
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_left);
        make.top.equalTo(view1.mas_bottom).with.offset(10);
        make.width.equalTo(view1.mas_width).with.multipliedBy(0.3);
        make.height.equalTo(view1.mas_height);
    }];
}

#pragma Mark - Custom Accessores
- (TestTableViewController *)testVC {
    if (!_testVC) {
        _testVC = [[TestTableViewController alloc] init];
    }
    return _testVC;
}

#pragma Mark - Private Method
- (void)friendatTenttionAction {
    FBLog(@"friendatTenttionAction !!!!");
}

- (void)radarAction {
    FBLog(@"radarAction !!!!");
}

#pragma Mark - Button Action
- (void)titleBtnAction:(UIButton *)sender {
    DropMenuView *menu = [DropMenuView menu];
    menu.delegate = self;
    self.testVC.view.width = 100;
    self.testVC.view.height = 44 * 4;
    menu.controller = self.testVC;
    [menu showFrom:sender];
}

- (void)dismissMenu {
    [DropMenuView dismiss];
}

- (void)dropMenuDidShow:(DropMenuView *)menu {
    FBLog(@"DropMenuView!!!!!");
    [self addChildViewController:self.testVC];
}

- (void)clickButtonPushModalVC {
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    modalVC.delegate = self;
    modalVC.transitioningDelegate = self;
    [self presentViewController:modalVC animated:YES completion:nil];
}

- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.navigationController pushViewController:self.testVC animated:YES];
    }];
}

- (id<UIViewControllerAnimatedTransitioning>)
    animationControllerForPresentedController:(UIViewController *)presented
                         presentingController:(UIViewController *)presenting
                             sourceController:(UIViewController *)source {
    return [BouncePresentAnimation new];
}

@end
