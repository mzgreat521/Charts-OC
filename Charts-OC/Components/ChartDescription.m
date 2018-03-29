//
//  ChartDescription.m
//  Charts
//
//  Created by mz on 2018/3/21.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartDescription.h"

@implementation ChartDescription

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    
    return self;
}
- (void)initialize {
    _text = @"Description Label";
    _textAlign = NSTextAlignmentRight;
    _textColor = [UIColor blackColor];
    _font = [UIFont systemFontOfSize:8.0];
}

@end
