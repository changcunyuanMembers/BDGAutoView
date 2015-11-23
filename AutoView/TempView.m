//
//  TempView.m
//  AutoView
//
//  Created by Liang on 15/11/23.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "TempView.h"
#import "Masonry.h"

@implementation TempView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
            
        UILabel *label1 = [[UILabel alloc] init];
        label1.text = @"我是TempView中子视图";
        label1.font = [UIFont systemFontOfSize:15];
        label1.numberOfLines = 0;
        label1.backgroundColor = [UIColor greenColor];
        [self addSubview:label1];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(-5);
            make.left.mas_equalTo(5);
        }];
    }
    return self;
}

@end
