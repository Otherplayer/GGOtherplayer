//
//  GDetailViewController.m
//  GNav
//
//  Created by __无邪_ on 15/4/16.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "GDetailViewController.h"
#import <SFGaugeView/SFGaugeView.h>
@interface GDetailViewController ()
@property (strong, nonatomic)SFGaugeView *topTachometer;
@end

@implementation GDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    self.topTachometer = [[SFGaugeView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    [self.view addSubview:self.topTachometer];
    self.topTachometer.bgColor = [UIColor colorWithRed:0/255.0 green:124/255.0 blue:205/255.0 alpha:1];
    self.topTachometer.needleColor = [UIColor colorWithRed:0/255.0 green:39/255.0 blue:64/255.0 alpha:1];
    self.topTachometer.hideLevel = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action:(id)sender {
    
    
    //定义个转场动画
    CATransition *animation = [CATransition animation];
    //转场动画持续时间
    animation.duration = 0.2f;
    //计时函数，从头到尾的流畅度？？？
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    //转场动画类型
    animation.type = kCATransitionMoveIn;
    //转场动画将去的方向
    animation.subtype = kCATransitionFromTop;
    //动画时你需要的实现
    //添加动画 （转场动画是添加在层上的动画）
    [self.navigationController.navigationBar.layer addAnimation:animation forKey:@"animation"];
    
//    GDetailViewController *controller = [[GDetailViewController alloc] init];
    
//    [controller.view setFrame:CGRectMake(0, 1000, self.view.frame.size.width, self.view.frame.size.height)];
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.view setFrame:CGRectMake(0, 1000, self.view.frame.size.width, self.view.frame.size.height)];
    }];
    [self.navigationController popViewControllerAnimated:NO];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
