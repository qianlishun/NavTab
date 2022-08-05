//
//  UIColor+QLSGradient.m
//  QLSNavTab
//
//  Created by Qianlishun on 2022/8/5.
//  Copyright © 2022 QLS. All rights reserved.
//

#import "UIColor+QLSGradient.h"

@implementation UIColor (QLSGradient)

+ (instancetype)gradientColorWithSize:(CGSize)size
                            direction:(GradientColorDirection)direction
                           startColor:(UIColor *)startcolor
                             endColor:(UIColor *)endColor {
    
    if (CGSizeEqualToSize(size, CGSizeZero) || !startcolor || !endColor) {
        return nil;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    if (direction == GradientColorDirectionUpwardDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    
    CGPoint endPoint = CGPointMake(0.0, 0.0);
    switch (direction) {
        case GradientColorDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case GradientColorDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case GradientColorDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            endPoint = CGPointMake(1.0, 0.0);
            break;
    }
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    
    gradientLayer.colors = @[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

+ (instancetype)gradientColorWithSize:(CGSize)size
                            direction:(GradientColorDirection)direction
                               colors:(NSArray<UIColor*>*)colors{
    
    if (CGSizeEqualToSize(size, CGSizeZero) || !colors || colors.count<1) {
        return nil;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    if (direction == GradientColorDirectionUpwardDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    
    CGPoint endPoint = CGPointMake(0.0, 0.0);
    switch (direction) {
        case GradientColorDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case GradientColorDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case GradientColorDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            endPoint = CGPointMake(1.0, 0.0);
            break;
    }
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    
    NSMutableArray *cgclors = [NSMutableArray array];
    NSMutableArray *locations = [NSMutableArray array];
    for (int i = 0; i< colors.count; i++) {
        float x = (float)i / (float)(colors.count-1);
        if(direction == GradientColorDirectionUpwardDiagonalLine){
            x = 1-x;
        }
        NSNumber *number = [NSNumber numberWithFloat:x];
        [locations addObject:number];
        [cgclors addObject:(__bridge id)colors[i].CGColor];
    }
    
    gradientLayer.colors = cgclors;
    gradientLayer.locations = locations;

    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
