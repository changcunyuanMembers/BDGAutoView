//
//  AutoManager.m
//  AutoView
//
//  Created by Liang on 15/11/23.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "AutoManager.h"
#import <UIKit/UIKit.h>

static AutoManager *shareManager = nil;

@implementation AutoManager

+ (AutoManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[AutoManager alloc] init];
    });
    return shareManager;
}

- (id)init {
    self = [super init];
    if (self) {
        _scale = [self AutoSizeScale];
    }
    return self;
}

// 计算自动布局比例
- (float)AutoSizeScale {
    
    float scale;
    
    float SCREEN_WIDTH = ([UIScreen mainScreen].bounds.size.width);
    float SCREEN_HEIGHT = ([UIScreen mainScreen].bounds.size.height);
    
    float stdWidth = 320;
    float stdHeight = 568;
    
    if (SCREEN_WIDTH <= stdWidth && SCREEN_HEIGHT <= stdHeight) {
        scale = 1.0;
    } else if (SCREEN_WIDTH / stdWidth > SCREEN_HEIGHT / stdHeight) {
        scale = SCREEN_HEIGHT / stdHeight;
    } else {
        scale = SCREEN_WIDTH / stdWidth;
    }
    return scale;
}

@end
