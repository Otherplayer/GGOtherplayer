//
//  ViewController.m
//  GNav
//
//  Created by __无邪_ on 15/4/16.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GDetailViewController.h"
#import "GGaugeView.h"
#import "VMOZLabel.h"


@interface ViewController ()
@property (nonatomic, strong)GGaugeView *gaugeView;
@property (nonatomic, strong)VMOZLabel *ozLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gaugeView = [[GGaugeView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    [self.gaugeView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.view addSubview:self.gaugeView];
    
    
    self.ozLabel = [[VMOZLabel alloc] initWithFrame:CGRectMake(0, 320, self.view.frame.size.width, 80)];
    [self.ozLabel setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.view addSubview:self.ozLabel];
    [self.ozLabel setFontSize:28];
    
    [self.ozLabel setTextColor:[UIColor redColor]];
    
    [self.ozLabel setIntValue:39 numeratorValue:10 denominatorValue:1];
    
    
    
    
    NSArray *fontArr = [UIFont fontNamesForFamilyName:@"Helvetica Neue"];
    NSLog(@"%@",fontArr);
    
    
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
    animation.subtype = kCATransitionFromBottom;
    //动画时你需要的实现
    //添加动画 （转场动画是添加在层上的动画）
    [self.navigationController.navigationBar.layer addAnimation:animation forKey:@"animation"];

    GDetailViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"GDetailViewController"];
    
    [controller.view setFrame:CGRectMake(0, 1000, self.view.frame.size.width, self.view.frame.size.height)];
    
    [UIView animateWithDuration:0.2 animations:^{
        [controller.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }];    
    
    [self.navigationController pushViewController:controller animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
