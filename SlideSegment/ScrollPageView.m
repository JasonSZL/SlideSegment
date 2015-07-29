//
//  ScrollPageView.m
//  test
//
//  Created by zhubch on 14-10-31.
//  Copyright (c) 2014年 zhubch. All rights reserved.
//

#import "ScrollPageView.h"
#import "SegmentView.h"

@interface ScrollPageView () <UIScrollViewDelegate>

@end

@implementation ScrollPageView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {

    }
    return self;
}

- (void)setDelegate:(id<UIScrollViewDelegate>)delegate
{
    [super setDelegate:delegate];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    CGRect frame = [self.pages[currentPage] frame];
    [self setContentOffset:CGPointMake(frame.origin.x, 0) animated:YES];
}

- (void)setPages:(NSArray *)pages
{
    _pages = pages;
    self.showsHorizontalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.delegate = self;
    float w = self.frame.size.width;
    float h = self.frame.size.height;
    self.contentSize = CGSizeMake(w * pages.count, 0);
    
    for (int i = 0; i<pages.count; i++) {
        [pages[i] setFrame:CGRectMake(i*w, 0, w, h)];
        [self addSubview:pages[i]];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float w = self.frame.size.width;
    self.currentPage = (int)self.contentOffset.x / (int)w;
    
    self.segment.selectedIndex = self.currentPage;
}

@end
