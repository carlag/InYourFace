//
//  IYFGradientImageView.m
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFGradientImageView.h"

@implementation IYFGradientImageView

-(void)awakeFromNib {
    [self addGradientTintToImage];
}

- (void)addGradientTintToImage {
    
    //Create a graphics context in the required size
    CGSize size = self.frame.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Create a colour space
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    //Create gradient
    UIColor *bottomColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    UIColor *topColour = [UIColor clearColor];
    NSArray *colours = [NSArray arrayWithObjects:(id)topColour.CGColor, (id)bottomColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors (colorspace, (CFArrayRef)colours, NULL);
    
    //Fill the context with the gradient, assuming vertical
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    //Create image from the context
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //Release gradent, colours space and context
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    self.image = gradientImage;
    
}
@end
