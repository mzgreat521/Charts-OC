//
//  ChartLegend.m
//  Charts
//
//  Created by mz on 2018/2/23.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartLegend.h"

@implementation ChartLegend

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
        self.yOffset = 3.0;
    }
    
    return self;
}
- (void)initialize {
    _isLegendCustom = NO;
    _horizontalAlignment = LeftH;
    _verticalAlignment = Bottom;
    _orientation = Horizontal;
    _drawInside = NO;
    _direction = LeftToRight;
    _font = [UIFont systemFontOfSize:10.0];
    _textColor = [UIColor blackColor];
    _form = Square;
    _formSize = 8.0;
    _formLineWidth = 3.0;
    _formLineDashPhase = 0.0;
    _formLineDashLengths = [NSMutableArray array];
    _xEntrySpace = 6.0;
    _yEntrySpace = 0.0;
    _formToTextSpace = 5.0;
    _stackSpace = 3.0;
    _calculatedLabelSizes = [NSMutableArray array];
    _calculatedLabelBreakPoints = [NSMutableArray array];
    _calculatedLineSizes = [NSMutableArray array];
    _neededWidth = 0.0;
    _neededHeight = 0.0;
    _textWidthMax = 0.0;
    _textHeightMax = 0.0;
    _wordWrapEnabled = YES;
    _maxSizePercent = 0.95;
}
- (instancetype)initWithEntries:(NSMutableArray<ChartLegendEntry *> *)entries {
    if (self = [super init]) {
        [self initialize];
        self.yOffset = 3.0;
        self.entries = entries;
    }
    
    return self;
}

- (CGSize)getMaximumEntrySizeWithFont:(UIFont *)font {
    CGFloat maxW = 0.0;
    CGFloat maxH = 0.0;
    
    CGFloat maxFormSize = 0.0;
    
    for (ChartLegendEntry *entry in _entries) {
        CGFloat formSize = isnan(entry.formSize) ? self.formSize : entry.formSize;
        if (formSize > maxFormSize) maxFormSize = formSize;
        if (!entry.label) continue;
        
        CGSize size = [entry.label sizeWithAttributes:@{NSFontAttributeName:font}];
        if (size.width > maxW) maxW = size.width;
        if (size.height > maxH) maxH = size.height;
    }
    
    return CGSizeMake(maxW + maxFormSize + _formToTextSpace, maxH);
}

- (void)calculateDimensionsWithLabelFont:(UIFont *)labelFont viewPortHandler:(ChartViewPortHandler *)viewPortHandler {
    CGSize maxEntrySize = [self getMaximumEntrySizeWithFont:labelFont];
    CGFloat defaultFormSize = self.formSize;
    CGFloat stackSpace = self.stackSpace;
    CGFloat formToTextSpace = self.formToTextSpace;
    CGFloat xEntrySpace = self.xEntrySpace;
    CGFloat yEntrySpace = self.yEntrySpace;
    BOOL wordWrapEnabled = self.isWordWrapEnabled;
    NSMutableArray *entries = self.entries;
    NSInteger entryCount = entries.count;
    
    _textWidthMax = maxEntrySize.width;
    _textHeightMax = maxEntrySize.height;
    
    switch (_orientation) {
        case Vertical:
        {
            CGFloat maxWidth = 0.0;
            CGFloat width = 0.0;
            CGFloat maxHeight = 0.0;
            CGFloat labelLineHeight = labelFont.lineHeight;
            
            BOOL wasStacked = NO;
            
            for (NSInteger i = 0; i < entryCount; i++) {
                ChartLegendEntry *e = entries[i];
                BOOL drawingForm = e.form != None;
                CGFloat formSize = isnan(e.formSize) ? defaultFormSize : e.formSize;
                NSString *label = e.label;
                
                if (!wasStacked) width = 0.0;
                
                if (drawingForm) {
                    if (wasStacked) width += stackSpace;
                    width += formSize;
                }
                
                if (label != nil) {
                    CGSize size = [label sizeWithAttributes:@{NSFontAttributeName:labelFont}];
                    
                    if (drawingForm && !wasStacked) {
                        width += formToTextSpace;
                    }else if (wasStacked) {
                        maxWidth = fmax(maxWidth, width);
                        maxHeight += labelLineHeight + yEntrySpace;
                        width = 0.0;
                        wasStacked = NO;
                    }
                    
                    width += size.width;
                    
                    if (i < entryCount - 1) maxHeight += labelLineHeight + yEntrySpace;
                }else {
                    wasStacked = YES;
                    width += formSize;
                    
                    if (i < entryCount - 1) width += stackSpace;
                }
                
                maxWidth = fmax(maxWidth, width);
            }
            
            _neededWidth = maxWidth;
            _neededHeight = maxHeight;
        }
            break;
        case Horizontal:
        {
            CGFloat labelLineHeight = labelFont.lineHeight;
            
            CGFloat contentWidth = viewPortHandler.contentWidth * _maxSizePercent;
            
            // Prepare arrays for calculated layout
            if (_calculatedLabelSizes.count != entryCount) {
                [_calculatedLineSizes removeAllObjects];
                for (NSInteger i = 0; i < entryCount; i++) {
                    [_calculatedLabelSizes addObject:[NSValue valueWithCGSize:CGSizeZero]];
                }
            }
            
            if (_calculatedLabelBreakPoints.count != entryCount) {
                [_calculatedLabelBreakPoints removeAllObjects];
                for (NSInteger i = 0; i < entryCount; i++) {
                    [_calculatedLabelBreakPoints addObject:[NSNumber numberWithBool:NO]];
                }
            }
            
            [_calculatedLineSizes removeAllObjects];
            
            // Start calculating layout
            NSDictionary *labelAttrs = @{NSFontAttributeName:labelFont};
            CGFloat maxLineWidth = 0.0;
            CGFloat currentLineWidth = 0.0;
            CGFloat requiredWidth = 0.0;
            NSInteger stackedStartIndex = -1;
            
            for (NSInteger i = 0; i < entryCount; i++) {
                ChartLegendEntry *e = entries[i];
                BOOL drawingForm = e.form != None;
                NSString *label = e.label;
                
                _calculatedLabelBreakPoints[i] = [NSNumber numberWithBool:NO];
                
                if (stackedStartIndex == -1) {
                    // we are not stacking, so required width is for this label only
                    requiredWidth = 0.0;
                }else {
                    // add the spacing appropriate for stacked labels/forms
                    requiredWidth += stackSpace;
                }
                
                // grouped forms have null labels
                if (label != nil) {
                    _calculatedLabelSizes[i] = [NSValue valueWithCGSize:[label sizeWithAttributes:labelAttrs]];
                    requiredWidth += drawingForm ? formToTextSpace + _formSize : 0.0;
                    requiredWidth += [_calculatedLabelSizes[i] CGSizeValue].width;
                }else {
                    _calculatedLabelSizes[i] = [NSValue valueWithCGSize:CGSizeZero];
                    requiredWidth += drawingForm ? _formSize : 0.0;
                    
                    if (stackedStartIndex == -1) {
                        // mark this index as we might want to break here later
                        stackedStartIndex = i;
                    }
                }
                
                if (label != nil || i == entryCount - 1) {
                    CGFloat requiredSpacing = currentLineWidth == 0.0 ? 0.0 : xEntrySpace;
                    
                    if (!wordWrapEnabled || // No word wrapping, it must fit.
                        currentLineWidth == 0.0 || // The line is empty, it must fit.
                        (contentWidth - currentLineWidth >= requiredSpacing + requiredWidth)) // It simply fits
                    {
                        // Expand current line
                        currentLineWidth += requiredSpacing + requiredWidth;
                    }else { // It doesn't fit, we need to wrap a line
                        
                        // Add current line size to array
                        [_calculatedLineSizes addObject:[NSValue valueWithCGSize:CGSizeMake(currentLineWidth, labelLineHeight)]];
                        maxLineWidth = fmax(maxLineWidth, currentLineWidth);
                        
                        // Start a new line
                        _calculatedLabelBreakPoints[stackedStartIndex > -1 ? stackedStartIndex : i] = [NSNumber numberWithBool:YES];
                        currentLineWidth = requiredWidth;
                    }
                    
                    if (i == entryCount - 1) { // Add last line size to array
                        [_calculatedLineSizes addObject:[NSValue valueWithCGSize:CGSizeMake(currentLineWidth, labelLineHeight)]];
                        maxLineWidth = fmax(maxLineWidth, currentLineWidth);
                    }
                }
                
                stackedStartIndex = label != nil ? -1 : stackedStartIndex;
            }
            
            _neededWidth = maxLineWidth;
            _neededHeight = labelLineHeight * _calculatedLineSizes.count +
            yEntrySpace * (_calculatedLineSizes.count == 0 ? 0 : (_calculatedLineSizes.count - 1));
        }
            
        default:
            break;
    }
    
    _neededWidth += self.xOffset;
    _neededHeight += self.yOffset;
}

- (void)setCustomEntries:(NSMutableArray<ChartLegendEntry *> *)entries {
    self.entries = entries;
    _isLegendCustom = YES;
}

- (void)resetCustom {
    _isLegendCustom = NO;
}

@end
