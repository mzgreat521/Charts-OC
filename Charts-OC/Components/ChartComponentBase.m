//
//  ChartComponentBase.m
//  Charts
//
//  Created by mz on 2018/2/23.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartComponentBase.h"

@implementation ChartComponentBase

- (instancetype)init {
    if (self = [super init]) {
        self.enabled = YES;
        self.xOffset = 5.0;
        self.yOffset = 5.0;
    }
    
    return self;
}

@end
