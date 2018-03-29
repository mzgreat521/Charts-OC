//
//  ChartXAxis.m
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartXAxis.h"

@implementation ChartXAxis

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
        self.yOffset = 4.0;
    }
    
    return self;
}
- (void)initialize {
    _labelWidth = 1.0;
    _labelHeight = 1.0;
    _labelRotatedWidth = 1.0;
    _labelRotatedHeight = 1.0;
    _labelRotationAngle = 0.0;
    _avoidFirstLastClippingEnabled = NO;
    _labelPosition = TopX;
    _wordWrapEnabled = NO;
    _wordWrapWidthPercent = 1.0;
}

@end
