//
//  ChartXAxis.h
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartAxisBase.h"

typedef NS_ENUM(NSInteger, XAxisLabelPosition) {
    TopX,
    BottomX,
    BothSided,
    TopInside,
    BottomInside
};

@interface ChartXAxis : ChartAxisBase

@property(nonatomic,assign)CGFloat labelWidth;
@property(nonatomic,assign)CGFloat labelHeight;
@property(nonatomic,assign)CGFloat labelRotatedWidth;
@property(nonatomic,assign)CGFloat labelRotatedHeight;
@property(nonatomic,assign)CGFloat labelRotationAngle;
@property(nonatomic,assign,getter=isAvoidFirstLastClippingEnabled)BOOL avoidFirstLastClippingEnabled;
@property(nonatomic,assign)XAxisLabelPosition labelPosition;
@property(nonatomic,assign,getter=isWordWrapEnabled)BOOL wordWrapEnabled;
@property(nonatomic,assign)CGFloat wordWrapWidthPercent;

@end
