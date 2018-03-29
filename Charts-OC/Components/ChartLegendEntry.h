//
//  ChartLegendEntry.h
//  Charts
//
//  Created by mz on 2018/3/21.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ChartLegendForm) {
    None,
    Empty,
    Default,
    Square,
    Circle,
    Line
};

@interface ChartLegendEntry : NSObject

@property(nonatomic,copy)NSString *label;
@property(nonatomic,assign)ChartLegendForm form;
@property(nonatomic,assign)CGFloat formSize;
@property(nonatomic,assign)CGFloat formLineWidth;
@property(nonatomic,assign)CGFloat formLineDashPhase;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *formLineDashLengths;
@property(nonatomic,strong)UIColor *formColor;

- (instancetype)initWithLabel:(NSString *)label form:(ChartLegendForm)form formSize:(CGFloat)formSize formLineWidth:(CGFloat)formLineWidth formLineDashPhase:(CGFloat)formLineDashPhase formLineDashLengths:(NSMutableArray *)formLineDashLengths formColor:(UIColor *)formColor;

@end
