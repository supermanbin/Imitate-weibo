//
//  UIBarButtonItem+Tools.h
//  FBweibo
//
//  Created by 封斌 on 16/4/4.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Tools)
/**
 *  自定义navigationItem不同的点击状态
 *
 *  @param target         target
 *  @param action         action
 *  @param normalImage    正常状态图片
 *  @param highlightImage 点击高亮图片
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)navigationItemAddTarget:(id)target
                                      action:(SEL)action
                              forNormalImage:(NSString *)normalImage
                                forHighImage:(NSString *)highlightImage;

/**
 *  <#Description#>
 *
 *  @param target <#target description#>
 *  @param action <#action description#>
 *  @param title  <#title description#>
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)navigationItemAddTarget:(id)target
                                      action:(SEL)action
                                   withTitle:(NSString *)title;
@end
