//
//  ViewController.m
//  Scrollview-分页
//
//  Created by Demi  on 15/9/17.
//  Copyright (c) 2015年 Demi . All rights reserved.
//

#import "ViewController.h"
#define kCount 3


@interface ViewController () <UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
}


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat w = _scrollView.frame.size.width;
    CGFloat h = _scrollView.frame.size.height;
    for (int i = 0; i < kCount; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        
        //set frame
        imageView.frame = CGRectMake(i * w, 0, w, h);
        
        //set images
        NSString *imgName = [NSString stringWithFormat:@"0%d.png", i + 1];
        imageView.image = [UIImage imageNamed:imgName];
        
        [_scrollView addSubview:imageView];
    }
    
    //height == 0 代表禁止垂直方向滚动
    _scrollView.contentSize = CGSizeMake(kCount * w, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    //add pageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.center = CGPointMake(w * 0.5, h - 20);
    pageControl.bounds = CGRectMake(0, 0, 150, 50);
    pageControl.numberOfPages = kCount;
    
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    pageControl.enabled = NO;
    
    [self.view addSubview:pageControl];
    
    _pageControl = pageControl;
    
}

#pragma mark delegate method of UIscrollView
#pragma mark called when scrollView is rolling

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"%d", page);
    
    //set page
    _pageControl.currentPage = page;
}

@end
