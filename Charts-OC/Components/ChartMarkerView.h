//
//  ChartMarkerView.h
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IChartMarker.h"
@class ChartViewBase;

@interface ChartMarkerView : UIView<IChartMarker>

@property(nonatomic,assign)CGPoint offset;
@property(nonatomic,weak)ChartViewBase *chartView;

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)point;

- (void)refreshContentWithEntry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight;

- (void)drawWithContext:(CGContextRef)context point:(CGPoint)point;

@end
