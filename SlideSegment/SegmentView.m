//
//  SegmentView.m
//  test
//
//  Created by zhubch on 14-10-31.
//  Copyright (c) 2014年 zhubch. All rights reserved.
//

#import "SegmentView.h"

#define kDefaultHighlightColor [UIColor colorWithRed:0 green:0.5 blue:0.9 alpha:1]
#define kDefaultTitleColor [UIColor blackColor]

@implementation SegmentView
{
    UIView *view;
    float width;
}

- (void)setTitles:(NSArray *)titles
{
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    
    _titles = titles;
    
    int count = (int)titles.count;
    width = self.frame.size.width/count;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((i)*width, 0, width, self.frame.size.height)];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.tag = 10+i;
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [btn setTitleColor:kDefaultHighlightColor forState:UIControlStateSelected];
        [btn setTitleColor:kDefaultTitleColor forState:UIControlStateNormal];

        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
    }
    self.selectedIndex = 0;
    view = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-2, width, 2)];
    view.backgroundColor = kDefaultHighlightColor;
    [self addSubview:view];
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    for (int i=10; i<self.titles.count+10;i++) {
        UIButton *btn = (UIButton*)[self viewWithTag:i];

        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
}

- (void)setHighlightColor:(UIColor *)highlightColor
{
    _highlightColor = highlightColor;
    for (int i=10; i<self.titles.count+10;i++) {
        UIButton *btn = (UIButton*)[self viewWithTag:i];
        
        [btn setTitleColor:highlightColor forState:UIControlStateSelected];
    }
    view.backgroundColor = highlightColor;
}

- (void)btnClick:(UIButton*)button
{
    int index = (int)button.tag-10;
    
    if (self.selectedIndex == index) {
        return;
    }
    
    self.selectedIndex = index;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    [self.pageView setContentOffset:CGPointMake(selectedIndex*self.frame.size.width, 0) animated:YES];

    if (self.segmentChanged) {
        self.segmentChanged(selectedIndex);
    }
    [UIView animateWithDuration:0.5 animations:^{
        view.frame = CGRectMake(width*(selectedIndex), self.bounds.size.height-2, width, 2);
    }];
    for (int i=10; i<self.titles.count+10;i++) {
        UIButton *btn = (UIButton*)[self viewWithTag:i];
        if (_selectedIndex+10 == btn.tag) {
            btn.selected = YES;
        }else{
            btn.selected = NO;
        }
    }
}

- (void)setPageView:(ScrollPageView *)pageView
{
    _pageView = pageView;
    pageView.segment = self;
}

@end
