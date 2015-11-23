//
//  UIView+PefAuto.h
//  AutoView
//
//  Created by Liang on 15/11/20.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AutoLayoutBlock)(void);

@interface UIView (AutoLayout)

@property (nonatomic, strong) NSNumber *isAutoLayout;


- (void)updateContentConstraints;
- (void)updateContentFrame;

@end