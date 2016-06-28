//
//  ComposeViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/4/19.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualEffectView.frame = self.view.frame;
    [self.view addSubview:visualEffectView];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_camera"]
                   forState:UIControlStateNormal];
    btn.size = btn.currentBackgroundImage.size;
    btn.center = self.view.center;
    [btn addTarget:self
            action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    [visualEffectView addSubview:btn];
}

- (void)dismissVC {
    [self dismissViewControllerAnimated:YES completion:^{
        FBLog(@"Dismiss!!!");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
