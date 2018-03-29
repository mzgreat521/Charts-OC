//
//  ChartMarkerImage.h
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IChartMarker.h"
@class ChartViewBase;

@interface ChartMarkerImage : NSObject<IChartMarker>

@property(nonatomic,strong)UIImage *image;
@property(nonatomic,assign)CGPoint offset;
@property(nonatomic,weak)ChartViewBase *chartView;
@property(nonatomic,assign)CGSize size;

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)point;

- (void)refreshContentWithEntry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight;

- (void)drawWithContext:(CGContextRef)context point:(CGPoint)point;

@end
