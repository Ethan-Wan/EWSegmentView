//
//  EWSegmentHeadView.m
//  EWSegmentView
//
//  Created by wansy on 15/7/8.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "EWSegmentHeadView.h"

@interface EWSegmentHeadView()

@property (nonatomic,strong) UIButton *selectedHeadButton;

@property (nonatomic,strong) UIView *buttonView;

@property (nonatomic,strong) UILabel *slideLabel;

@property (nonatomic,strong) UIView *bottomView;
@end

@implementation EWSegmentHeadView

#pragma mark - init/alloc

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.buttonView = [[UIView alloc] init];
    [self addSubview:self.buttonView];
    
    self.bottomView = [[UIView alloc] init];
    [self addSubview:self.bottomView];
    
    self.slideLabel = [[UILabel alloc] init];
    [self addSubview:self.slideLabel];
}

/**
 *  布局按钮
 */
-(void)layoutSubviews
{
    CGFloat viewH = self.frame.size.height;
    CGFloat viewW = self.frame.size.width;
    CGFloat headButtonW = viewW/self.buttonView.subviews.count;
    
    //按钮view布局
    self.buttonView.frame = CGRectMake(0, 0, viewW, viewH * 0.9);
    
    //按钮布局
    [self.buttonView.subviews enumerateObjectsUsingBlock:^(UIButton *headButton, NSUInteger idx, BOOL *stop) {
        headButton.frame = CGRectMake(idx * headButtonW, 0, headButtonW , self.buttonView.bounds.size.height);
    }];
    
    //底部view布局
    self.bottomView.frame = CGRectMake(0, viewH*0.9, viewW, viewH*0.1);
    
    //滑块布局
    self.slideLabel.frame = CGRectMake(headButtonW * 0.05, viewH*0.9, headButtonW*0.9, viewH*0.1);
    
}

#pragma mark - private method

/**
 *  根据传入控制器的标题来添加按钮
 *
 *  @param title 控制器标题
 */
-(void)addHeadButton:(NSString *)title
{
    UIButton *headButton = [[UIButton alloc] init];
    
    //设置按钮的基本属性
    [headButton setTitle:title forState:UIControlStateNormal];
    [headButton setTitleColor:self.selectedTitleColor?self.selectedTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [headButton setTitleColor:self.normalTitleColor?self.normalTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [headButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    if (!self.selectedHeadButton) {
        self.selectedHeadButton = headButton;
        if (!self.isHiddenBottom)
        {
            [self.slideLabel setBackgroundColor:self.bottomColor?self.bottomColor:[UIColor orangeColor]];
        }
        self.selectedHeadButton.selected = YES;
    }
    [self.buttonView addSubview:headButton];
}

/**
 *  按钮的切换
 *
 *  @param button 按钮
 */
-(void)turnSelectedButton:(UIButton *)button
{
    //话动颜色
    if (!self.isHiddenBottom) {
        [UIView animateWithDuration:0.4 animations:^{
            CGFloat labelX = button.frame.origin.x + button.frame.size.width*0.05;
            CGFloat labelY = button.frame.size.height;
            CGFloat labelW = self.slideLabel.bounds.size.width;
            CGFloat labelH = self.slideLabel.bounds.size.height;
            
            self.slideLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
        }];
    }
    
    self.selectedHeadButton.selected = NO;
    button.selected = YES;
    self.selectedHeadButton = button;
}

#pragma mark - event response

-(void)buttonClick:(UIButton *)button
{
    if(self.selectedHeadButton == button) return;
    [self turnSelectedButton:button];
    
    if (self.didClick) {
        _didClick();
    }
}

#pragma mark - public method

-(void)setHeadTitles:(NSMutableArray *)titles
{
    [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
        [self addHeadButton:title];
    }];
}

-(void)setSelectedButtonIndex:(NSInteger)selectedButtonIndex
{
    UIButton *headButton = self.buttonView.subviews[selectedButtonIndex];
    
    [self turnSelectedButton:headButton];
}

-(NSInteger)selectedButtonIndex
{
    return [self.buttonView.subviews indexOfObject:self.selectedHeadButton];
}

@end
