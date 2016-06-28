//
//  UIBarButtonItem+Tools.m
//  FBweibo
//
//  Created by 封斌 on 16/4/4.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "UIBarButtonItem+Tools.h"
// 常量定义
static const CGFloat buttonItemHeight = 40.f;
static const CGFloat padding = 10.f;

@implementation UIBarButtonItem (Tools)
+ (UIBarButtonItem *)navigationItemAddTarget:(id)target
                                      action:(SEL)action
                              forNormalImage:(NSString *)normalImage
                                forHighImage:(NSString *)highlightImage {
    
    UIButton *itemBtn = [[UIButton alloc] init];
    [itemBtn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [itemBtn setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    itemBtn.size = itemBtn.currentImage.size;
    [itemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    
    return item;
}

+ (UIBarButtonItem *)navigationItemAddTarget:(id)target
                                      action:(SEL)action
                                   withTitle:(NSString *)title {
    
    UIButton *itemBtn = [[UIButton alloc] init];
    
    // 设置普通状态样式
    NSMutableDictionary *attrNormalDict = [NSMutableDictionary dictionary];
    attrNormalDict[NSForegroundColorAttributeName] = RGBCOLOR(0x000000, 1);
    attrNormalDict[NSFontAttributeName] = [UIFont systemFontOfSize:13.f];
    NSAttributedString *attrNormalStr = [[NSAttributedString alloc] initWithString:title
                                                                        attributes:attrNormalDict];
    // 设置点击状态样式
    NSMutableDictionary *attrHighlightDict = [NSMutableDictionary dictionary];
    attrHighlightDict[NSForegroundColorAttributeName] = RGBCOLOR(0xFF7720, 1);
    attrHighlightDict[NSFontAttributeName] = [UIFont systemFontOfSize:13.f];
    NSAttributedString *attrHightlightStr = [[NSAttributedString alloc] initWithString:title
                                                                            attributes:attrHighlightDict];
    
    CGSize size = [title sizeWithAttributes:attrNormalDict];
    // 设置btn的宽度和高度使其更容易被点到
    itemBtn.height = buttonItemHeight;
    itemBtn.width = size.width + padding;
    [itemBtn setAttributedTitle:attrNormalStr forState:UIControlStateNormal];
    [itemBtn setAttributedTitle:attrHightlightStr forState:UIControlStateHighlighted];
    [itemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    
    return item;
    
}

@end
