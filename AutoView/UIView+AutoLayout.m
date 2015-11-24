//
//  UIView+PefAuto.m
//  AutoView
//
//  Created by Liang on 15/11/20.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "UIView+AutoLayout.h"
#import <objc/runtime.h>
#import "AutoManager.h"

static char isAutoKey = 'a';
static char isCustomKey = 'b';

@interface UIView ()

/**
 *  存储自动布局值
 */
@property (nonatomic, strong) id autoLayoutValue;

/**
 *  存储自定义布局值
 */
@property (nonatomic, strong) id customViewValue;

@end

@implementation UIView (AutoLayout)

@dynamic isCustomView;
@dynamic isAutoLayout;

- (void)setIsAutoLayout:(BOOL)isAutoLayout {
    self.autoLayoutValue = isAutoLayout ? @"0" : @"1";
}

- (void)setIsCustomView:(BOOL)isCustomView {
    self.customViewValue = isCustomView ? @"1" : @"0";
}

- (void)setAutoLayoutValue:(id)autoLayoutValue {
    objc_setAssociatedObject(self, &isAutoKey, autoLayoutValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)autoLayoutValue {
    
    id value = objc_getAssociatedObject(self, &isAutoKey);
    return [value boolValue] ? @"0" : @"1";
}

- (void)setCustomViewValue:(id)customViewValue {
    objc_setAssociatedObject(self, &isCustomKey, customViewValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)customViewValue {
    return objc_getAssociatedObject(self, &isCustomKey);
}

// 更新约束
- (void)updateContentConstraints {
    
    for (UIView *v in self.subviews) {
        if ([v.autoLayoutValue boolValue]) {
            [self updateContentConstraints:v];
        }
    }
}

// 更新某个视图约束
- (void)updateContentConstraints:(UIView *)view {
    
    if (view.customViewValue) {
        for (UIView *v in view.subviews) {
            if (v.customViewValue) {
                [self updateContentConstraints:view];
            } else {
                [self update:view];
            }
        }
    } else {
        [self update:view];
    }
}

// 更新
- (void)update:(UIView *)view {
    
    if ([view isKindOfClass:[UILabel class]]) {
        [self updateText:(UILabel *)view];
    }
    
    NSArray* constrainsArray = view.constraints;
    for (NSLayoutConstraint* constraint in constrainsArray) {
        constraint.constant = constraint.constant * kAutoScale;
    }
    [view updateConstraintsIfNeeded];
}

// 更新文本
- (void)updateText:(UILabel *)label {
    
    NSString *fontName = label.font.fontName;
    CGFloat fontSize = label.font.pointSize;
    label.font = [UIFont fontWithName:fontName size:fontSize * kAutoScale];
}

@end
