//
//  SearchBar.m
//  FBweibo
//
//  Created by 封斌 on 16/4/28.
//  Copyright © 2016年 supermanUI. All rights reserved.
//

#import "SearchBar.h"

@implementation SearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage imageNamed:@"search_navigationbar_textfield_background"];
        UIImageView *leftSearchIconView = [[UIImageView alloc] init];
        leftSearchIconView.width = 32.f;
        leftSearchIconView.height = 32.f;
        leftSearchIconView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        leftSearchIconView.contentMode = UIViewContentModeCenter;
        self.leftView = leftSearchIconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:13.f];
        
    }
    return self;
}

+ (instancetype)searchBar {
    return [[self alloc] init];
}
@end
