//
//  GGaugeView.m
//  GNav
//
//  Created by __无邪_ on 15/4/17.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "GGaugeView.h"

@implementation GGaugeView

- (void)drawRect:(CGRect)rect {
    
    
    [self drawImageLabels];
}

- (void) drawImageLabels
{
    UIImage *badImg = [self imageNamed:@"needle.png" withColor:[UIColor redColor] drawAsOverlay:NO];
    
    CGFloat scaleFactor = (self.bounds.size.width / badImg.size.width)/30 ;
    
    [badImg drawInRect:CGRectMake(0, 0, badImg.size.width * scaleFactor, badImg.size.height * scaleFactor)];
}


- (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color drawAsOverlay:(BOOL)overlay{
    // load the image
    UIImage *img = [UIImage imageNamed:name];
    
    // begin a new image context, to draw our colored image onto
    UIGraphicsBeginImageContextWithOptions(img.size, NO, [[UIScreen mainScreen] scale]);
    
    // get a reference to that context we created
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the fill color
    [color setFill];
    
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // set the blend mode to overlay, and the original image
    CGContextSetBlendMode(context, kCGBlendModeOverlay);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    if(overlay) CGContextDrawImage(context, rect, img.CGImage);
    
    // set a mask that matches the shape of the image, then draw (overlay) a colored rectangle
    CGContextClipToMask(context, rect, img.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return the color-burned image
    return coloredImg;
}


#pragma mark custom getter/setter

- (CGPoint)center
{
    return CGPointMake([self centerX], [self centerY]);
}

- (CGFloat)centerY
{
    return self.bounds.size.height - (self.bounds.size.height * 0.2);
}

- (CGFloat)centerX
{
    return self.bounds.size.width/2;
}



@end
