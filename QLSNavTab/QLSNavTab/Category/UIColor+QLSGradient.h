//
//  UIColor+QLSGradient.h
//  QLSNavTab
//
//  Created by Qianlishun on 2022/8/5.
//  Copyright © 2022 QLS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GradientColorDirection) {
    GradientColorDirectionLevel,//水平渐变
    GradientColorDirectionVertical,//竖直渐变
    GradientColorDirectionDownDiagonalLine,//向上对角线渐变
    GradientColorDirectionUpwardDiagonalLine,//向下对角线渐变
};

@interface UIColor (QLSGradient)

/// 渐变色
/// @param size 需要渐变的大小
/// @param direction 渐变的方向
/// @param startcolor 渐变的开始颜色
/// @param endColor 渐变的结束颜色
+ (instancetype)gradientColorWithSize:(CGSize)size
                            direction:(GradientColorDirection)direction
                           startColor:(UIColor *)startcolor
                             endColor:(UIColor *)endColor;

+ (instancetype)gradientColorWithSize:(CGSize)size
                            direction:(GradientColorDirection)direction
                            colors:(NSArray<UIColor*>*)colors;
@end

NS_ASSUME_NONNULL_END
