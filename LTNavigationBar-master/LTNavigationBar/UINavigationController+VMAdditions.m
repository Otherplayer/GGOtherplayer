//
//  UINavigationController+VMAdditions.m
//  VMark
//
//  Created by __无邪_ on 15/3/2.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UINavigationController+VMAdditions.h"
#import "UIColor+Gradient.h"
@implementation UINavigationController (VMAdditions)

- (void)applyAppDefaultApprence{
    [self applyApprenceWithBarTintColor:[UIColor blueColor] fontColor:[UIColor whiteColor]];
}

- (void)applyApprenceWithBarTintColor:(UIColor *)tintColor fontColor:(UIColor *)fontColor{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UINavigationBar *navigationBar = self.navigationBar;
    
    [navigationBar setTitleTextAttributes:@{
                                            NSFontAttributeName : [UIFont systemFontOfSize:20.f],
                                            NSForegroundColorAttributeName : fontColor,
                                            }];
    [navigationBar setTintColor:fontColor];    //设置字体颜色
    
    UIColor *color = [UIColor gradientFromColor:[UIColor colorWithRed:0.953 green:0.486 blue:0.059 alpha:1.000] toColor:[UIColor colorWithRed:0.949 green:0.000 blue:0.322 alpha:1.000] withHeight:64];
    
    [navigationBar setBarTintColor:color]; //设置背景色
    
//    [navigationBar setBackgroundImage:[UIImage imageNamed:@"5.jpg"] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setTranslucent:YES];        //关透明
}

- (void)setHide:(BOOL)hide{
    [self setNavigationBarHidden:hide animated:YES];
}

@end
