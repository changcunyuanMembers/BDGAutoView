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

/**
 *  更新子视图约束
 */
- (void)updateContentConstraints;

/**
 *  更新子视图frame
 */
- (void)updateContentFrame;


/**
 *  更新视图本身约束
 *
 *  @param isUpdateSubView 是否更新subView
 */
- (void)updateOriginConstraints:(BOOL)isUpdateSubView;

/**
 *  更新视图本身frame
 *
 *  @param isUpdateSubView 是否更新subView
 */
- (void)updateOriginFrame:(BOOL)isUpdateSubView;

@end