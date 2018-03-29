//
//  ChartMarkerImage.m
//  Charts
//
//  Created by mz on 2018/3/24.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartMarkerImage.h"
#import "ChartViewBase.h"

@implementation ChartMarkerImage

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)point {
    CGPoint offset = self.offset;
    
    CGSize size = self.size;
    
    if (size.width == 0.0 && _image != nil) size.width = _image.size.width ? _image.size.width : 0.0;
    if (size.height == 0.0 && _image != nil) size.height = _image.size.height ? _image.size.height : 0.0;
    
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    if (point.x + offset.x < 0.0) {
        offset.x = -point.x;
    }else if (self.chartView != nil && point.x + width + offset.x > self.chartView.bounds.size.width) {
        offset.x = self.chartView.bounds.size.width - point.x - width;
    }
    
    if (point.y + offset.y < 0) {
        offset.y = -point.y;
    }else if (self.chartView != nil && point.y + height + offset.y > self.chartView.bounds.size.height) {
        offset.y = self.chartView.bounds.size.height - point.y - height;
    }
    
    return offset;
}

- (void)refreshContentWithEntry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight {
    // Do nothing here...
}

- (void)drawWithContext:(CGContextRef)context point:(CGPoint)point {
    if (!_image) return;
    
    CGPoint offset = [self offsetForDrawingAtPoint:point];
    
    CGSize size = self.size;
    
    if (size.width == 0.0) size.width = _image.size.width;
    if (size.height == 0.0) size.height = _image.size.height;
    
    CGRect rect = CGRectMake(point.x + offset.x, point.y + offset.y, size.width, size.height);
    
    UIGraphicsPushContext(context);
    [_image drawInRect:rect];
    UIGraphicsPopContext();
}

@end
