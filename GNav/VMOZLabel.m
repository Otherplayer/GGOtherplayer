//
//  VMOZLabel.m
//  GNav
//
//  Created by __无邪_ on 15/4/20.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "VMOZLabel.h"

@interface VMOZLabel()
@property (nonatomic, strong)UILabel *valueLabel;
@property (nonatomic, strong)UILabel *intLabel;
@property (nonatomic, strong)UILabel *numeratorLabel;//分子
@property (nonatomic, strong)UILabel *denominatorLabel;//分母
@property (nonatomic, strong)UILabel *lineLabel;

@property (nonatomic, strong)UILabel *unitMainLabel;
@property (nonatomic, strong)UILabel *unitSubLabel;
@end

@implementation VMOZLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGRect mainRect = [[UIScreen mainScreen] bounds];
        CGFloat height = 80;
        CGFloat width = mainRect.size.width / 3;
        
        self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width - 20, height)];
        [self.valueLabel setTextAlignment:NSTextAlignmentRight];
        [self.valueLabel setText:@"0"];
        [self.valueLabel setAdjustsFontSizeToFitWidth:YES];
        [self addSubview:self.valueLabel];
        
        
        self.unitMainLabel = [[UILabel alloc] initWithFrame:CGRectMake(width - 20, 50, 20, height - 50)];
        [self.unitMainLabel setTextColor:[UIColor darkGrayColor]];
        [self.unitMainLabel setText:@"lb"];
        [self addSubview:self.unitMainLabel];
        
        
        
        self.unitSubLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainRect.size.width - 30, 50, 20, height - 50)];
        [self.unitSubLabel setTextColor:[UIColor darkGrayColor]];
        [self.unitSubLabel setText:@"oz"];
        [self addSubview:self.unitSubLabel];
        
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(2 * width, height / 2 - 1, width/2, 2)];
        [self.lineLabel setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:self.lineLabel];
        
        self.numeratorLabel = [[UILabel alloc] initWithFrame:CGRectMake(2 * width, 0, width/2, height / 2)];
        [self addSubview:self.numeratorLabel];
        [self.numeratorLabel setTextAlignment:NSTextAlignmentCenter];
        [self.numeratorLabel setText:@"12"];
        [self.numeratorLabel setAdjustsFontSizeToFitWidth:YES];
        
        
        self.denominatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(2 * width, height/ 2, width/2, height / 2)];
        [self addSubview:self.denominatorLabel];
        [self.denominatorLabel setTextAlignment:NSTextAlignmentCenter];
        [self.denominatorLabel setText:@"20"];
        [self.denominatorLabel setAdjustsFontSizeToFitWidth:YES];
        
        self.intLabel = [[UILabel alloc] initWithFrame:CGRectMake(width, 0, width, height)];
        [self addSubview:self.intLabel];
        [self.intLabel setTextAlignment:NSTextAlignmentRight];
        [self.intLabel setText:@"18"];
        [self.intLabel setAdjustsFontSizeToFitWidth:YES];
        
        
        
        
        
    }
    return self;
}

- (void)setFontSize:(CGFloat)fontSize{
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:fontSize];
    [self.numeratorLabel setFont:font];
    [self.denominatorLabel setFont:font];
    //    font = [UIFont systemFontOfSize:fontSize + 70];
    font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:fontSize + 55];
    [self.valueLabel setFont:font];
    [self.intLabel setFont:font];
}


- (void)setTextColor:(UIColor *)color{
    [self.valueLabel setTextColor:color];
    [self.intLabel setTextColor:color];
    [self.numeratorLabel setTextColor:color];
    [self.denominatorLabel setTextColor:color];
    [self.lineLabel setBackgroundColor:color];
}

- (void)setValue:(int)value intValue:(int)intValue numeratorValue:(int)numerator denominatorValue:(int)denominator{
    [self.valueLabel setText:[NSString stringWithFormat:@"%d",value]];
    [self.intLabel setText:[NSString stringWithFormat:@"%d",intValue]];
    [self.numeratorLabel setText:[NSString stringWithFormat:@"%d",numerator]];
    [self.denominatorLabel setText:[NSString stringWithFormat:@"%d",denominator]];
}

- (void)setIntValue:(int)intValue numeratorValue:(int)numerator denominatorValue:(int)denominator{
    [self.intLabel setText:[NSString stringWithFormat:@"%d",intValue]];
    [self.numeratorLabel setText:[NSString stringWithFormat:@"%d",numerator]];
    [self.denominatorLabel setText:[NSString stringWithFormat:@"%d",denominator]];
    
//    if (numerator == 0) {
//        [self.numeratorLabel setHidden:YES];
//        [self.denominatorLabel setHidden:YES];
//        [self.lineLabel setHidden:YES];
//        [self.intLabel setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
//    }else{
//        [self.numeratorLabel setHidden:NO];
//        [self.denominatorLabel setHidden:NO];
//        [self.lineLabel setHidden:NO];
//        [self.intLabel setCenter:CGPointMake(self.frame.size.width / 2 - self.frame.size.width/2, 0)];
//    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
