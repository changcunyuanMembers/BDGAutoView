//
//  UIView+PefAuto.h
//  AutoView
//
//  Created by Liang on 15/11/20.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout)

/**
 *  是否开启自动适配, 默认为YES
 */
@property (nonatomic) BOOL isAutoLayout;

/**
 *  是否是自定义视图，默认为NO
 */
@property (nonatomic) BOOL isCustomView;

/**
 *  更新子视图约束
 */
- (void)updateContentConstraints;


@end