//
//  ChartMarkerView.m
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartMarkerView.h"
#import "ChartViewBase.h"

@implementation ChartMarkerView

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)point {
    if (!self.chartView) return self.offset;
    
    CGPoint offset = self.offset;
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    if (point.x + offset.x < 0.0) {
        offset.x = -point.x;
    }else if (point.x + width + offset.x > self.chartView.bounds.size.width) {
        offset.x = self.chartView.bounds.size.width - point.x - width;
    }
    
    if (point.y + offset.y < 0) {
        offset.y = -point.y;
    }else if (point.y + height + offset.y > self.chartView.bounds.size.height) {
        offset.y = self.chartView.bounds.size.height - point.y - height;
    }
    
    return offset;
}

- (void)refreshContentWithEntry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight {
    // Do nothing here...
}

- (void)drawWithContext:(CGContextRef)context point:(CGPoint)point {
    CGPoint offset = [self offsetForDrawingAtPoint:point];
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, point.x + offset.x, point.y + offset.y);
    UIGraphicsPushContext(context);
    [self.layer renderInContext:context];
    UIGraphicsPopContext();
    CGContextRestoreGState(context);
}

@end
