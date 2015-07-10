//
//  ViewController.h
//  EWSegmentView
//
//  Created by wansy on 15/7/8.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EWSegmentHeadView.h"
#import "EWSegmentView.h"

@interface EWViewController : UIViewController

@property (weak, nonatomic) IBOutlet EWSegmentHeadView *headView;

@property (weak, nonatomic) IBOutlet EWSegmentView *segmentView;

@end

