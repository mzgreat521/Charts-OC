//
//  ChartComponentBase.h
//  Charts
//
//  Created by mz on 2018/2/23.
//  Copyright © 2018年 mz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChartComponentBase : NSObject

@property(nonatomic,assign,getter=isEnabled)BOOL enabled;
@property(nonatomic,assign)CGFloat xOffset;
@property(nonatomic,assign)CGFloat yOffset;

@end
