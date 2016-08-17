//
//  NavigationItemTitleViewButton.m
//  FBweibo
//
//  Created by 封斌 on 16/8/13.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "NavigationItemTitleViewButton.h"
#import <pop/POP.h>

@implementation NavigationItemTitleViewButton

+ (instancetype)button {
    return [self buttonWithType:UIButtonTypeCustom];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor colorWithRed:0.24 green:0.24 blue:0.24 alpha:1.00]
                       forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"]
                  forState:UIControlStateNormal];
        
        [self addTarget:self action:@selector(buttonTouchDownAction:)
           forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
        [self addTarget:self action:@selector(buttonTouchUpInsideAction:)
           forControlEvents:UIControlEventTouchUpInside];
        
        self.adjustsImageWhenHighlighted = NO; // 去除点击是图片上的阴影
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3.0;
        self.contentEdgeInsets = UIEdgeInsetsMake(0.0, 6.0, 0.0, 6.0);
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        
//        FBLog(@"%@", NSStringFromCGRect(frame));
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

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
