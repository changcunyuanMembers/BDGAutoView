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

@implementation UIView (AutoLayout)

- (NSNumber *)isAutoLayout {
    
    NSNumber *autoValue = objc_getAssociatedObject(self, &isAutoKey);
    return [NSNumber numberWithBool:!autoValue.boolValue];
}

- (void)setIsAutoLayout:(NSNumber *)isAutoLayout {
     objc_setAssociatedObject(self, &isAutoKey, isAutoLayout, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setMakeAuto:(AutoLayoutBlock)makeAuto {
    
}

// 更新约束
- (void)updateContentConstraints {
    
    for (UIView *v in self.subviews) {
        if ([v.isAutoLayout boolValue]) {
            
            if ([v isKindOfClass:[UILabel class]]) {
                [self updateText:(UILabel *)v];
            } else {
                
                NSArray* constrainsArray = v.constraints;
                for (NSLayoutConstraint* constraint in constrainsArray) {
                    constraint.constant = constraint.constant * [AutoManager shareManager].scale;
                }
                [v updateConstraintsIfNeeded];
            }
        }
    }
}

// 更新传统布局
- (void)updateContentFrame {
    float scale = [AutoManager shareManager].scale;
    
    for (UIView *v in self.subviews) {
        if ([v.isAutoLayout boolValue]) {
            
            if ([v isKindOfClass:[UILabel class]]) {
                [self updateText:(UILabel *)v];
            }
            
            CGRect newRect;
            newRect.origin.x = v.frame.origin.x * scale;
            newRect.origin.y = v.frame.origin.y * scale;
            newRect.size.width = v.frame.size.width * scale;
            newRect.size.height = v.frame.size.height * scale;
            v.frame = newRect;
        }
    }
}

// 更新文本
- (void)updateText:(UILabel *)label {
    
    float scale = [AutoManager shareManager].scale;

    NSString *fontName = label.font.fontName;
    CGFloat fontSize = label.font.pointSize;

    label.font = [UIFont fontWithName:fontName size:fontSize * scale];
}

@end
