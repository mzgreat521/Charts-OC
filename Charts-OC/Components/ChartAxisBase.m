//
//  ChartAxisBase.m
//  Charts
//
//  Created by mz on 2018/3/2.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartAxisBase.h"

@implementation ChartAxisBase
{
    ChartDefaultAxisValueFormatter *_axisValueFormatter;
    NSInteger _labelCount;
    double _granularity;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    
    return self;
}
- (void)initialize {
    _labelFont = [UIFont systemFontOfSize:10.0];
    _labelTextColor = [UIColor blackColor];
    _axisLineColor = [UIColor grayColor];
    _axisLineWidth = 0.5;
    _axisLineDashPhase = 0.0;
    _axisLineDashLengths = [NSMutableArray array];
    _gridColor = [[UIColor grayColor] colorWithAlphaComponent:0.9];
    _gridLineWidth = 0.5;
    _gridLineDashPhase = 0.0;
    _gridLineDashLengths = [NSMutableArray array];
    _gridLineCap = kCGLineCapButt;
    _drawGridLinesEnabled = YES;
    _drawAxisLineEnabled = YES;
    _drawLabelsEnabled = YES;
    _centerAxisLabelsEnabled = NO;
    _limitLines = [NSMutableArray array];
    _drawLimitLinesBehindDataEnabled = NO;
    _gridAntialiasEnabled = YES;
    _entries = [NSMutableArray array];
    _centeredEntries = [NSMutableArray array];
    _labelCount = 6;
    _granularity = 1.0;
    _decimals = 0;
    _granularityEnabled = NO;
    _forceLabelsEnabled = NO;
    _spaceMin = 0.0;
    _spaceMax = 0.0;
    _customAxisMin = NO;
    _customAxisMax = NO;
    _axisMinimum = 0;
    _axisMaximum = 0;
    _axisRange = 0;
    _axisMinLabels = 2;
    _axisMaxLabels = 25;
}

- (BOOL)centerAxisLabelsEnabled {
    return _centerAxisLabelsEnabled && self.entryCount > 0;
}

- (NSInteger)entryCount {
    return self.entries.count;
}

- (void)setGranularity:(double)granularity {
    _granularity = granularity;
    _granularityEnabled = YES;
}

- (NSString *)getLongestLabel {
    NSString *longest = @"";
    
    for (NSInteger i = 0; i < self.entries.count; i++) {
        NSString *text = [self getFormattedLabelWithIndex:i];
        if (longest.length < text.length) longest = text;
    }
    
    return longest;
}

- (NSString *)getFormattedLabelWithIndex:(NSInteger)index {
    if (index < 0 || index >= self.entries.count) return @"";
    
    return [self.valueFormatter stringForValue:[self.entries[index] doubleValue] axis:self] ? [self.valueFormatter stringForValue:[self.entries[index] doubleValue] axis:self] : @"";
}

- (void)setValueFormatter:(ChartDefaultAxisValueFormatter *)axisValueFormatter {
    _axisValueFormatter = axisValueFormatter ? axisValueFormatter : [[ChartDefaultAxisValueFormatter alloc] init];
}
- (ChartDefaultAxisValueFormatter *)valueFormatter {
    if (_axisValueFormatter == nil || ([_axisValueFormatter isKindOfClass:[ChartDefaultAxisValueFormatter class]] && _axisValueFormatter.hasAutoDecimals && _axisValueFormatter.decimals != _decimals)) {
        _axisValueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithDecimals:_decimals];
    }
    
    return _axisValueFormatter;
}

- (void)setAxisMinLabels:(NSInteger)axisMinLabels {
    _axisMinLabels = axisMinLabels > 0 ? axisMinLabels : _axisMinLabels;
}

- (void)setAxisMaxLabels:(NSInteger)axisMaxLabels {
    _axisMaxLabels = axisMaxLabels > 0 ? axisMaxLabels : _axisMaxLabels;
}

- (void)setLabelCount:(NSInteger)labelCount {
    _labelCount = labelCount;
    if (_labelCount > _axisMaxLabels) _labelCount = _axisMaxLabels;
    if (_labelCount < _axisMinLabels) _labelCount = _axisMinLabels;
    _forceLabelsEnabled = NO;
}
- (void)setLabelCount:(NSInteger)labelCount force:(BOOL)force {
    self.labelCount = labelCount;
    _forceLabelsEnabled = force;
}

- (void)addLimitLine:(ChartLimitLine *)line {
    if (line)  [_limitLines addObject:line];
}
- (void)removeLimitLine:(ChartLimitLine *)line {
    [_limitLines removeObject:line];
}
- (void)removeAllLimitLines {
    [_limitLines removeAllObjects];
}

- (void)resetCustomAxisMin {
    _customAxisMin = NO;
}
- (void)resetCustomAxisMax {
    _customAxisMax = NO;
}
- (void)setAxisMinimum:(double)axisMinimum {
    _customAxisMin = YES;
    _axisMinimum = axisMinimum;
    _axisRange = fabs(_axisMaximum - axisMinimum);
}
- (void)setAxisMaximum:(double)axisMaximum {
    _customAxisMax = YES;
    _axisMaximum = axisMaximum;
    _axisRange = fabs(axisMaximum - _axisMinimum);
}
- (void)calculateWithDataMin:(double)dataMin dataMax:(double)dataMax {
    // if custom, use value as is, else use data value
    double min = _customAxisMin ? _axisMinimum : (dataMin - _spaceMin);
    double max = _customAxisMax ? _axisMaximum : (dataMax + _spaceMax);
    
    // temporary range (before calculations)
    double range = fabs(max - min);
    
    // in case all values are equal
    if (range == 0.0) {
        max = max + 1.0;
        min = min - 1.0;
    }
    
    _axisMinimum = min;
    _axisMaximum = max;
    
    // actual range
    _axisRange = fabs(max - min);
}

@end
