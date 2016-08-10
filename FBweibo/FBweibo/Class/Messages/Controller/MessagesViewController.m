//
//  MessagesViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/23.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self
                                                                              action:@selector(findFriendGroupAction)
                                                                           withTitle:@"发现群"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem navigationItemAddTarget:self
                                                                               action:@selector(newChatAction)
                                                                       forNormalImage:@"navigationbar_icon_newchat"
                                                                         forHighImage:@"navigationbar_icon_newchat_highlight"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -private method
/**
 *  发现群  221019574655
 */
- (void)findFriendGroupAction {
    FBLog(@"发现群");
}

/**
 *  发起聊天
 */
- (void)newChatAction {
    FBLog(@"发起聊天");
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"CELL";
    
    UITableViewCell *cell;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row -- %ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
