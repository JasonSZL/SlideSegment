//
//  SegmentView.h
//  test
//
//  Created by zhubch on 14-10-31.
//  Copyright (c) 2014年 zhubch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollPageView.h"

@interface SegmentView : UIView

/**
 *  这个block在页面改变后被调用
 */
@property (nonatomic,copy) void(^segmentChanged)(NSInteger);

/**
 *  所有页面对应的标题
 */
@property (nonatomic,strong) NSArray *titles;

/**
 *  选中了第几个
 */
@property (nonatomic,assign) NSInteger selectedIndex;

/**
 *  关联的scrollPageView
 */
@property (nonatomic,strong) ScrollPageView *pageView;

/**
 *  未选中状态的标题颜色
 */
@property (nonatomic,strong) UIColor *titleColor;

/**
 *  选中的标题颜色，和下面横条的颜色
 */
@property (nonatomic,strong) UIColor *highlightColor;

@end
