//
//  ChartDescription.h
//  Charts
//
//  Created by mz on 2018/3/21.
//  Copyright © 2018年 mz. All rights reserved.
//

#import "ChartComponentBase.h"

@interface ChartDescription : ChartComponentBase

@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)CGPoint position;
@property(nonatomic,assign)NSTextAlignment textAlign;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,strong)UIColor *textColor;

@end
