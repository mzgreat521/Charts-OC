//
//  ChartLimitLine.m
//  Charts
//
//  Created by mz on 2018/3/19.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartLimitLine.h"

@implementation ChartLimitLine

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    
    return self;
}
- (void)initialize {
    _limit = 0.0;
    _lineWidth = 2.0;
    _lineColor = [UIColor colorWithRed:237.0/255.0 green:91.0/255.0 blue:91.0/255.0 alpha:1.0];
    _lineDashPhase = 0.0;
    _lineDashLengths = [NSMutableArray array];
    _valueTextColor = [UIColor blackColor];
    _valueFont = [UIFont systemFontOfSize:13.0];
    _drawLabelEnabled = YES;
    _label = @"";
    _labelPosition = RightTop;
}
- (instancetype)initWithLimit:(double)limit {
    if (self = [super init]) {
        [self initialize];
        _limit = limit;
    }
    
    return self;
}
- (instancetype)initWithLimit:(double)limit label:(NSString *)label {
    if (self = [super init]) {
        [self initialize];
        _limit = limit;
        _label = label;
    }
    
    return self;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    if (lineWidth < 0.2) {
        _lineWidth = 0.2;
    }else if (lineWidth > 12.0) {
        _lineWidth = 12.0;
    }else {
        _lineWidth = lineWidth;
    }
}

@end
