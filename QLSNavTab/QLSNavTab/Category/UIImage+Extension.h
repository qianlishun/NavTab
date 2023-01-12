#import <UIKit/UIKit.h>

@interface UIImage (Extension)

// 缩放图片
- (UIImage *)scaleToSize:(CGSize)size;

- (UIImage *)scaleToSize:(CGSize)size fit:(CGFloat)fit;

+ (UIImage*) createImageWithColor: (UIColor*) color;

+ (UIImage*) createImageWithColor: (UIColor*) color size:(CGSize)size isRound:(BOOL)round;

- (UIImage*)roundRadius:(CGFloat)radius size:(CGSize)size;

+ (UIImage*) createImageWithColor: (UIColor*) color edge:(CGFloat)scale;

- (UIImage*)changeColor:(UIColor*)color;
@end
