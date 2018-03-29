//
//  IChartMarker.h
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ChartDataEntry;
@class ChartHighlight;

@protocol IChartMarker <NSObject>

@property(nonatomic,assign)CGPoint offset;

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)point;

- (void)refreshContentWithEntry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight;

- (void)drawWithContext:(CGContextRef)context point:(CGPoint)point;

@end
