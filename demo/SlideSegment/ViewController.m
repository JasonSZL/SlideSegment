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
    //实例化3个view
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectZero];
    v1.backgroundColor = [UIColor purpleColor];
    
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectZero];
    v2.backgroundColor = [UIColor magentaColor];
    
    UIView *v3 = [[UIView alloc]initWithFrame:CGRectZero];
    v3.backgroundColor = [UIColor orangeColor];
    
    //需要放上来的view，请务必在ScrollPageView被加载之后给pages属性赋值，否则你需要自己计算每个view的frame
    _pageView.pages = @[v1,v2,v3];
    
    //关联的segment
    _pageView.segment = _pageSegment;
    
    //segment上view对应的标题
    _pageSegment.titles = @[@"标题1",@"标题2",@"标题3"];
    
    //设置选中栏的高亮颜色
    _pageSegment.highlightColor = [UIColor colorWithRed:0 green:0.5 blue:0.9 alpha:1];
    
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
