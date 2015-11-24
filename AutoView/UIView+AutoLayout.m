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

@implementation UIView (AutoLayout)

- (id)isAutoLayout {
    id value = objc_getAssociatedObject(self, &isAutoKey);
    if ([value boolValue]) {
        return @"0";
    }
    return @"1";
}

- (void)setIsAutoLayout:(id)isAutoLayout {
    
    NSString *value = @"1";
    if ([isAutoLayout boolValue]) {
        value = @"0";
    }
    objc_setAssociatedObject(self, &isAutoKey, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)isCustom {
    return objc_getAssociatedObject(self, &isCustomKey);
}

- (void)setIsCustom:(id)isCustom {
    objc_setAssociatedObject(self, &isCustomKey, isCustom, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// 更新约束
- (void)updateContentConstraints {
    
    for (UIView *v in self.subviews) {
        if ([v.isAutoLayout boolValue]) {
            [self updateContentConstraints:v];
        }
    }
}

// 更新某个视图约束
- (void)updateContentConstraints:(UIView *)view {
    
    if (view.isCustom) {
        for (UIView *v in view.subviews) {
            if (v.isCustom) {
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
