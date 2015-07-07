//
//  VMOZLabel.h
//  GNav
//
//  Created by __无邪_ on 15/4/20.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VMOZLabel : UIView

- (void)setFontSize:(CGFloat)fontSize;
- (void)setTextColor:(UIColor *)color;


- (void)setIntValue:(int)intValue numeratorValue:(int)numerator denominatorValue:(int)denominator;
- (void)setValue:(int)value intValue:(int)intValue numeratorValue:(int)numerator denominatorValue:(int)denominator;
@end
