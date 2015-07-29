//
//  ViewController.m
//  SlideSegment
//
//  Created by zhubch on 15/7/29.
//  Copyright (c) 2015年 zhubch. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"
#import "ScrollPageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SegmentView *pageSegment;
@property (weak, nonatomic) IBOutlet ScrollPageView *pageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectZero];
    v1.backgroundColor = [UIColor purpleColor];
    
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectZero];
    v2.backgroundColor = [UIColor lightGrayColor];
    
    UIView *v3 = [[UIView alloc]initWithFrame:CGRectZero];
    v3.backgroundColor = [UIColor orangeColor];
    
    //写这个控件时没考虑自动布局，所以下面这几行代码请务必写在viewWillAppear或者viewDidAppear方法中中。
    //需要放上来的view，
    _pageView.pages = @[v1,v2,v3];
    
    //关联的segment
    _pageView.segment = _pageSegment;
    
    //segment上view对应的标题
    _pageSegment.titles = @[@"标题1",@"标题2",@"标题3"];
    
    //设置选中栏的高亮颜色
    _pageSegment.highlightColor = [UIColor blueColor];
    
    //segment切换时候的回调
    _pageSegment.segmentChanged = ^(NSInteger index){
        _pageView.currentPage = index;
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
