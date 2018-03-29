//
//  ChartAxisBase.h
//  Charts
//
//  Created by mz on 2018/3/2.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartComponentBase.h"
#import "ChartDefaultAxisValueFormatter.h"
#import "ChartLimitLine.h"

@interface ChartAxisBase : ChartComponentBase

@property(nonatomic,strong)UIFont *labelFont;
@property(nonatomic,strong)UIColor *labelTextColor;
@property(nonatomic,strong)UIColor *axisLineColor;
@property(nonatomic,assign)CGFloat axisLineWidth;
@property(nonatomic,assign)CGFloat axisLineDashPhase;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *axisLineDashLengths;
@property(nonatomic,strong)UIColor *gridColor;
@property(nonatomic,assign)CGFloat gridLineWidth;
@property(nonatomic,assign)CGFloat gridLineDashPhase;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *gridLineDashLengths;
@property(nonatomic,assign)CGLineCap gridLineCap;
@property(nonatomic,assign,getter=isDrawGridLinesEnabled)BOOL drawGridLinesEnabled;
@property(nonatomic,assign,getter=isDrawAxisLineEnabled)BOOL drawAxisLineEnabled;
@property(nonatomic,assign,getter=isDrawLabelsEnabled)BOOL drawLabelsEnabled;
@property(nonatomic,assign,getter=isCenterAxisLabelsEnabled)BOOL centerAxisLabelsEnabled;
@property(nonatomic,assign,getter=isDrawLimitLinesBehindDataEnabled)BOOL drawLimitLinesBehindDataEnabled;
@property(nonatomic,assign)BOOL gridAntialiasEnabled;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *entries;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *centeredEntries;
@property(nonatomic,assign)NSInteger entryCount;
@property(nonatomic,assign)NSInteger decimals;
@property(nonatomic,assign,getter=isGranularityEnabled)BOOL granularityEnabled;
@property(nonatomic,assign)double granularity;
@property(nonatomic,assign,getter=isForceLabelsEnabled)BOOL forceLabelsEnabled;
@property(nonatomic,strong)ChartDefaultAxisValueFormatter *valueFormatter;
@property(nonatomic,assign)double spaceMin;
@property(nonatomic,assign)double spaceMax;
@property(nonatomic,assign)double axisRange;
@property(nonatomic,assign)NSInteger axisMinLabels;
@property(nonatomic,assign)NSInteger axisMaxLabels;
@property(nonatomic,assign,getter=isAxisMinCustom)BOOL customAxisMin;
@property(nonatomic,assign,getter=isAxisMaxCustom)BOOL customAxisMax;
@property(nonatomic,assign)double axisMinimum;
@property(nonatomic,assign)double axisMaximum;
@property(nonatomic,assign)NSInteger labelCount;
@property(nonatomic,strong)NSMutableArray<ChartLimitLine *> *limitLines;

- (NSString *)getLongestLabel;

- (NSString *)getFormattedLabelWithIndex:(NSInteger)index;

- (void)setLabelCount:(NSInteger)labelCount force:(BOOL)force;

- (void)addLimitLine:(ChartLimitLine *)line;
- (void)removeLimitLine:(ChartLimitLine *)line;
- (void)removeAllLimitLines;

- (void)resetCustomAxisMin;
- (void)resetCustomAxisMax;
- (void)calculateWithDataMin:(double)dataMin dataMax:(double)dataMax;

@end
