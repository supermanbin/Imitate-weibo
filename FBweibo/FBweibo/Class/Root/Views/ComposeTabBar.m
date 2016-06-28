//
//  ComposeTabBar.m
//  FBweibo
//
//  Created by 封斌 on 16/4/8.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "ComposeTabBar.h"



@implementation ComposeTabBar
@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.width = [UIScreen mainScreen].bounds.size.width;
        self.height = 46.f;
        // 2、设置根控制器
        self.backgroundImage = [[UIImage alloc] init];
        // 设置毛玻璃效果
        UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        view.layer.shadowColor = [UIColor blackColor].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 0.f);
        view.layer.shadowRadius = 1.5f;
        view.layer.shadowOpacity = .15f;
        view.frame = CGRectMake(0, 2, self.width, self.height-2);
        [self addSubview:view];
        // 去掉上边线
        [self setShadowImage:[[UIImage alloc] init]];
        self.opaque = YES;
        self.translucent = YES;
        
        UIImage *normalBackgroundImage = [UIImage imageNamed:@"tabbar_compose_button"];
        UIImage *highlightBackgroundImage = [UIImage imageNamed:@"tabbar_compose_button_highlighted"];
        UIImage *normalImage = [UIImage imageNamed:@"tabbar_compose_icon_add"];
        UIImage *highlightImage = [UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"];
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
        [btn setBackgroundImage:highlightBackgroundImage forState:UIControlStateHighlighted];
        [btn setImage:normalImage forState:UIControlStateNormal];
        [btn setImage:highlightImage forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(plusTabBarActicon) forControlEvents:UIControlEventTouchUpInside];
        btn.size = btn.currentBackgroundImage.size;
        btn.x = self.width/2 - btn.width/2;
        btn.y = self.height/2 - btn.height/2 + 1;
        [self addSubview:btn];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int i = 0;
    CGFloat viewWidth = self.width / 5;
    for (UIView *view in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.width = viewWidth;
            view.x = i * viewWidth;
            view.y = 2;
            i++;
            if (i == 2) {
                i++;
            }
        }
    }
}

- (void)plusTabBarActicon {
    if ([self.delegate respondsToSelector:@selector(composeTabBarClickAction)]) {
        [self.delegate composeTabBarClickAction];
    }
}

@end
