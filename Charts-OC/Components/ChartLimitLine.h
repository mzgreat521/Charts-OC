//
//  ChartLimitLine.h
//  Charts
//
//  Created by mz on 2018/3/19.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartComponentBase.h"

typedef NS_ENUM(NSInteger, LabelPosition) {
    LeftTop,
    LeftBottom,
    RightTop,
    RightBottom
};

@interface ChartLimitLine : ChartComponentBase

@property(nonatomic,assign)double limit;
@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,strong)UIColor *lineColor;
@property(nonatomic,assign)CGFloat lineDashPhase;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *lineDashLengths;
@property(nonatomic,strong)UIColor *valueTextColor;
@property(nonatomic,strong)UIFont *valueFont;
@property(nonatomic,assign)BOOL drawLabelEnabled;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,assign)LabelPosition labelPosition;

- (instancetype)initWithLimit:(double)limit;
- (instancetype)initWithLimit:(double)limit label:(NSString *)label;

@end
