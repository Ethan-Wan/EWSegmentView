//
//  ViewController.m
//  EWSegmentView
//
//  Created by wansy on 15/7/8.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "EWViewController.h"

@interface EWViewController ()

@end

@implementation EWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIViewController *test1Vc = [[UIViewController alloc] init];
    test1Vc.title = @"test1";
    test1Vc.view.backgroundColor = [UIColor redColor];
    UIViewController *test2Vc = [[UIViewController alloc] init];
    test2Vc.title = @"test2";
    test2Vc.view.backgroundColor = [UIColor yellowColor];
    UIViewController *test3Vc = [[UIViewController alloc] init];
    test3Vc.title = @"test3";
    test3Vc.view.backgroundColor = [UIColor greenColor];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:test1Vc];
    [array addObject:test2Vc];
    [array addObject:test3Vc];

    self.segmentView.pages = array;
    self.segmentView.headView = self.headView;
}

@end
