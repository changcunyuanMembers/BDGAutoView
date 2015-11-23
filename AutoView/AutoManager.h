//
//  AutoManager.h
//  AutoView
//
//  Created by Liang on 15/11/23.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutoManager : NSObject

+ (AutoManager *)shareManager;

@property (nonatomic, readonly) float scale;

@end
