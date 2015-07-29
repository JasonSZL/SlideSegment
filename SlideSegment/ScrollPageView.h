//
//  ScrollPageView.h
//  test
//
//  Created by zhubch on 14-10-31.
//  Copyright (c) 2014年 zhubch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SegmentView;

@interface ScrollPageView : UIScrollView 

@property (weak,nonatomic) SegmentView *segment;

@property (assign,nonatomic) NSInteger currentPage;

/**
 *  pages是所有要显示的View的数组。
 *  这些 view的大小会被调整为self的大小
 */
@property (strong,nonatomic) NSArray *pages;

/**
 *  如果设置了delegate,- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView方法中要调用super的方法
 */
- (void)setDelegate:(id<UIScrollViewDelegate>)delegate;

@end
