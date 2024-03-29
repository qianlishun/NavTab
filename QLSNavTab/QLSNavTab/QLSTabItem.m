//
//  QLSTabBarItem.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSTabItem.h"

#define kDockItemSelectedBg @"tabbar_slider.png"
@interface QLSTabItem()
@property(nonatomic, strong) UIView *separatorView;
@end
@implementation QLSTabItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        
    }
    return self;
}

- (void)setSeparatorColor:(UIColor *)color{
    self.separatorView.backgroundColor = color;
}

- (UIView *)separatorView{
    if(!_separatorView){
        _separatorView = [UIView new];
        [self addSubview:_separatorView];
    }
    return _separatorView;
}
#pragma mark 覆盖父类在highlighted时的所有操作
-(void)setHighlighted:(BOOL)highlighted{

    [super setHighlighted:highlighted];
}

#pragma mark 调整内部ImageView的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height;
    if (self.titleLabel.text.length) {
        imageH = contentRect.size.height * (1-kTitleRatio);
    }
    
    if(_separatorView){
        _separatorView.frame = CGRectMake(0, 0.3*self.bounds.size.height, 1,  0.4*self.bounds.size.height);
    }
    
    return CGRectMake(imageX, imageY+imageH*0.05, imageW, imageH*0.9);

}

#pragma mark 调整内部UILabel的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleHeight;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY*0.97, titleWidth, titleHeight);
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    [super addTarget:target action:action forControlEvents:controlEvents];
    
}
@end
