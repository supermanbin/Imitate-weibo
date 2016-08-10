//
//  DiscoverViewController.m
//  FBweibo
//
//  Created by 封斌 on 16/3/22.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "DiscoverViewController.h"
#import "SearchBar.h"

@interface DiscoverViewController ()
<UITextFieldDelegate>
@property (nonatomic, strong) SearchBar *searchBar;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    // 添加搜索框
    SearchBar *searchBar = [SearchBar searchBar];
    searchBar.width = self.view.width - 20.f;
    searchBar.height = 32.f;
    searchBar.placeholder = @"大家正在搜：......";
    searchBar.returnKeyType = UIReturnKeySearch;
    searchBar.delegate = self;
    self.searchBar = searchBar;
    self.navigationItem.titleView = self.searchBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]) {
        [self.searchBar resignFirstResponder];
        [self.view endEditing:YES];
        return NO;
    }
    return YES;
}
@end
