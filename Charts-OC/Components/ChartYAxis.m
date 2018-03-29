//
//  ChartYAxis.m
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartYAxis.h"

@implementation ChartYAxis

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
        self.yOffset = 0.0;
    }
    
    return self;
}
- (void)initialize {
    _drawBottomYLabelEntryEnabled = YES;
    _drawTopYLabelEntryEnabled = YES;
    _inverted = NO;
    _drawZeroLineEnabled = NO;
    _zeroLineColor = [UIColor grayColor];
    _zeroLineWidth = 1.0;
    _zeroLineDashPhase = 0.0;
    _zeroLineDashLengths = [NSMutableArray array];
    _spaceTop = 0.1;
    _spaceBottom = 0.1;
    _labelPosition = OutsideChart;
    _axisDependency = Left;
    _minWidth = 0;
    _maxWidth = DBL_MAX;
}
- (instancetype)initWithPosition:(AxisDependency)position {
    if (self = [super init]) {
        [self initialize];
        _axisDependency = position;
        self.yOffset = 0.0;
    }
    
    return self;
}

- (CGSize)requiredSize {
    NSString *label = [self getLongestLabel];
    CGSize size = [label sizeWithAttributes:@{NSFontAttributeName:self.labelFont}];
    size.width += self.xOffset * 2.0;
    size.height += self.yOffset * 2.0;
    size.width = fmax(_minWidth, fmin(size.width, _maxWidth > 0.0 ? _maxWidth : size.width));
    
    return size;
}
- (CGFloat)getRequiredHeightSpace {
    return [self requiredSize].height;
}

- (BOOL)needsOffset {
    return self.isEnabled && self.isDrawLabelsEnabled && _labelPosition == OutsideChart;
}

- (void)calculateWithDataMin:(double)dataMin dataMax:(double)dataMax {
    // if custom, use value as is, else use data value
    double min = self.customAxisMin ? self.axisMinimum : dataMin;
    double max = self.customAxisMax ? self.axisMaximum : dataMax;
    
    // temporary range (before calculations)
    double range = fabs(max - min);
    
    // in case all values are equal
    if (range == 0.0) {
        max = max + 1.0;
        min = min - 1.0;
    }
    
    // bottom-space only effects non-custom min
    if (!self.customAxisMin) {
        double bottomSpace = range * _spaceBottom;
        self.axisMinimum = min - bottomSpace;
    }
    
    // top-space only effects non-custom max
    if (!self.customAxisMax) {
        double topSpace = range * _spaceTop;
        self.axisMaximum = max + topSpace;
    }
    
    // calc actual range
    self.axisRange = fabs(self.axisMaximum - self.axisMinimum);
}

@end
