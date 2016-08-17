//
//  TestTableViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/8/16.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "TestTableViewController.h"
#import "DiscoverViewController.h"
#import "DropMenuView.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view delegate


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row--%ld", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverViewController *VC = [[DiscoverViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
