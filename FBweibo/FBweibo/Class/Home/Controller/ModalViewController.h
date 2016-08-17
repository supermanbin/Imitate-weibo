//
//  ModalViewController.h
//  FBweibo
//
//  Created by 封斌 on 16/8/17.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModalViewController;

@protocol ModalViewControllerDelegate <NSObject>

-(void) modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;

@end

@interface ModalViewController : UIViewController
@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;
@end
