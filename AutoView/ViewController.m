//
//  ViewController.m
//  AutoView
//
//  Created by Liang on 15/11/20.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"
#import "Masonry.h"
#import "TempView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"希望大家一起努力来完成这个库，对每个人成长都是很有帮助的";
    label1.font = [UIFont systemFontOfSize:20];
    label1.numberOfLines = 0;
    label1.isAutoLayout = @"0";
    label1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
    }];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.alpha = 0.3;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    TempView *temp1 = [[TempView alloc] initWithFrame:CGRectZero];
    temp1.backgroundColor = [UIColor blackColor];
    temp1.isCustom = @"1";
    [view addSubview:temp1];
    
    [temp1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(260, 100));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"希望大家一起努力来完成这个库，对每个人成长都是很有帮助的";
    label.font = [UIFont systemFontOfSize:20];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).with.offset(10);
        make.right.equalTo(view.mas_right);
        make.left.equalTo(view.mas_left);
    }];
    
    [self.view updateContentConstraints];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
