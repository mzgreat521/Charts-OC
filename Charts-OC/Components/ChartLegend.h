//
//  ChartLegend.h
//  Charts
//
//  Created by mz on 2018/2/23.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartComponentBase.h"
#import "ChartLegendEntry.h"
#import "ChartViewPortHandler.h"

typedef NS_ENUM(NSInteger, ChartLegendHorizontalAlignment) {
    LeftH,
    CenterH,
    RightH
};
typedef NS_ENUM(NSInteger, ChartLegendVerticalAlignment) {
    Top,
    CenterV,
    Bottom
};
typedef NS_ENUM(NSInteger, ChartLegendOrientation) {
    Horizontal,
    Vertical
};
typedef NS_ENUM(NSInteger, ChartLegendDirection) {
    LeftToRight,
    RightToLeft
};

@interface ChartLegend : ChartComponentBase

@property(nonatomic,strong)NSMutableArray<ChartLegendEntry *> *entries;
@property(nonatomic,strong)NSMutableArray<ChartLegendEntry *> *extraEntries;
@property(nonatomic,assign)BOOL isLegendCustom;
@property(nonatomic,assign)ChartLegendHorizontalAlignment horizontalAlignment;
@property(nonatomic,assign)ChartLegendVerticalAlignment verticalAlignment;
@property(nonatomic,assign)ChartLegendOrientation orientation;
@property(nonatomic,assign,getter=isDrawInsideEnabled)BOOL drawInside;
@property(nonatomic,assign)ChartLegendDirection direction;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,strong)UIColor *textColor;
@property(nonatomic,assign)ChartLegendForm form;
@property(nonatomic,assign)CGFloat formSize;
@property(nonatomic,assign)CGFloat formLineWidth;
@property(nonatomic,assign)CGFloat formLineDashPhase;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *formLineDashLengths;
@property(nonatomic,assign)CGFloat xEntrySpace;
@property(nonatomic,assign)CGFloat yEntrySpace;
@property(nonatomic,assign)CGFloat formToTextSpace;
@property(nonatomic,assign)CGFloat stackSpace;
@property(nonatomic,strong)NSMutableArray<NSValue *> *calculatedLabelSizes;
@property(nonatomic,strong)NSMutableArray<NSNumber *> *calculatedLabelBreakPoints;
@property(nonatomic,strong)NSMutableArray<NSValue *> *calculatedLineSizes;
@property(nonatomic,assign)CGFloat neededWidth;
@property(nonatomic,assign)CGFloat neededHeight;
@property(nonatomic,assign)CGFloat textWidthMax;
@property(nonatomic,assign)CGFloat textHeightMax;
@property(nonatomic,assign,getter=isWordWrapEnabled)BOOL wordWrapEnabled;
@property(nonatomic,assign)CGFloat maxSizePercent;

- (instancetype)initWithEntries:(NSMutableArray<ChartLegendEntry *> *)entries;

- (CGSize)getMaximumEntrySizeWithFont:(UIFont *)font;

- (void)calculateDimensionsWithLabelFont:(UIFont *)labelFont viewPortHandler:(ChartViewPortHandler *)viewPortHandler;

- (void)setCustomEntries:(NSMutableArray<ChartLegendEntry *> *)entries;

- (void)resetCustom;

@end
