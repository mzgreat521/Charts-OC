//
//  ChartLegendEntry.m
//  Charts
//
//  Created by mz on 2018/3/21.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartLegendEntry.h"

@implementation ChartLegendEntry

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    
    return self;
}
- (void)initialize {
    _form = Default;
    _formSize = NAN;
    _formLineWidth = NAN;
    _formLineDashPhase = 0.0;
    _formLineDashLengths = [NSMutableArray array];
}
- (instancetype)initWithLabel:(NSString *)label form:(ChartLegendForm)form formSize:(CGFloat)formSize formLineWidth:(CGFloat)formLineWidth formLineDashPhase:(CGFloat)formLineDashPhase formLineDashLengths:(NSMutableArray *)formLineDashLengths formColor:(UIColor *)formColor {
    if (self = [super init]) {
        [self initialize];
        self.label = label;
        self.form = form;
        self.formSize = formSize;
        self.formLineWidth = formLineWidth;
        self.formLineDashPhase = formLineDashPhase;
        self.formLineDashLengths = formLineDashLengths;
        self.formColor = formColor;
    }
    
    return self;
}

@end
