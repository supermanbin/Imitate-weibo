//
//  DropMenuView.h
//  FBweibo
//
//  Created by 封斌 on 16/8/13.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropMenuView : UIView

//
//- (void)showMenu;
//- (void)dismiss;

+ (instancetype)menu;
/**
 *  显示
 */
- (void)showFrom:(UIView *)fromView;

/**
 *  销毁
 */
+ (void)dismiss;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;

/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *controller;

/**
 *  箭头位置
 */
@property (nonatomic, assign) CGFloat arrowDistence;

@end
