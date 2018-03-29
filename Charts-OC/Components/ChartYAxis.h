//
//  ChartYAxis.h
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartAxisBase.h"

typedef NS_ENUM(NSInteger, YAxisLabelPosition) {
    OutsideChart,
    InsideChart
};

typedef NS_ENUM(NSInteger, AxisDependency) {
    Left,
    Right
};

@interface ChartYAxis : ChartAxisBase

@property(nonatomic,assign,getter=isDrawBottomYLabelEntryEnabled)BOOL drawBottomYLabelEntryEnabled;
@property(nonatomic,assign,getter=isDrawTopYLabelEntryEnabled)BOOL drawTopYLabelEntryEnabled;
@property(nonatomic,assign,getter=isInverted)BOOL inverted;
@property(nonatomic,assign)BOOL drawZeroLineEnabled;
@property(nonatomic,strong)UIColor *zeroLineColor;
@property(nonatomic,assign)CGFloat zeroLineWidth;
@property(nonatomic,assign)CGFloat zeroLineDashPhase;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *zeroLineDashLengths;
@property(nonatomic,assign)CGFloat spaceTop;
@property(nonatomic,assign)CGFloat spaceBottom;
@property(nonatomic,assign)YAxisLabelPosition labelPosition;
@property(nonatomic,assign)AxisDependency axisDependency;
@property(nonatomic,assign)CGFloat minWidth;
@property(nonatomic,assign)CGFloat maxWidth;
@property(nonatomic,assign)BOOL needsOffset;

- (instancetype)initWithPosition:(AxisDependency)position;

- (CGSize)requiredSize;
- (CGFloat)getRequiredHeightSpace;

@end
