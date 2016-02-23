//
//  ViewController.m
//  testScrollView
//
//  Created by user on 16/2/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "CKViewController.h"
#import "WSGViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation ViewController
{
    UIView *black;
    UIView *red;
    UIView *blue;
    
    NSInteger i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    i = 0;
    
    [self.view addSubview:self.scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, 200);
        _scrollView.bounces = YES;
        _scrollView.alwaysBounceHorizontal = NO;
        _scrollView.alwaysBounceVertical = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
        
        black = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        black.backgroundColor = [UIColor blackColor];
        [_scrollView addSubview:black];
        
        red = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, 200)];
        red.backgroundColor = [UIColor redColor];
        [_scrollView addSubview:red];
        
        blue = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, 200)];
        blue.backgroundColor = [UIColor blueColor];
        [_scrollView addSubview:blue];
    }
    return _scrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_scrollView.contentOffset.x == 0) {
        
        i--;
        
    }
    else if (_scrollView.contentOffset.x == CGRectGetWidth(_scrollView.frame) * 2) {
        i++;
        
    }else
    {
        return;
    }

    
    NSLog(@"%ld",(long)i);
    
    if (i%3 == 0) {
        black.backgroundColor = [UIColor blackColor];
        
        red.backgroundColor = [UIColor redColor];
        
        blue.backgroundColor = [UIColor blueColor];
    }
    
    if (i%3 == 1) {
        black.backgroundColor = [UIColor redColor];
        
        red.backgroundColor = [UIColor blueColor];
        
        blue.backgroundColor = [UIColor blackColor];
    }
    
    if (i%3 == 2) {
        black.backgroundColor = [UIColor blueColor];
        
        red.backgroundColor = [UIColor blackColor];
        
        blue.backgroundColor = [UIColor redColor];
    }
    
    
    
    
    _scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%f",_scrollView.contentOffset.x);
    
    
    
    [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 2, 0) animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
    
//    WSGViewController *wsg = [[WSGViewController alloc] init];
    
    CKViewController *vc = [[CKViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:^{
        
    }];
}

@end
