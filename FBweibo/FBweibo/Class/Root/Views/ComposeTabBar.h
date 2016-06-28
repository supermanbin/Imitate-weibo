//
//  ComposeTabBar.h
//  FBweibo
//
//  Created by 封斌 on 16/4/8.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ComposeTabBarDelegate <UITabBarDelegate>

@optional
- (void)composeTabBarClickAction;

@end

@interface ComposeTabBar : UITabBar
@property (nonatomic, weak) id<ComposeTabBarDelegate> delegate;
@end
