//
//  QLSTabBar.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSTabBar.h"

@interface QLSTabBar ()

@end

@implementation QLSTabBar

-(void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_selected title:(NSString *)title{

    QLSTabItem *item = [[QLSTabItem alloc]init];

    // 文字
    if (title) {
        [item setTitle:title forState:UIControlStateNormal];
        [item setTitleColor:[UIColor lightGrayColor]forState:UIControlStateNormal];
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    }
    // 图标
    if (icon) {
        UIImage *iconImg = [UIImage imageNamed:icon];
        CGSize size = CGSizeMake(25, 25);

        iconImg = [self image:iconImg byScalingToSize:size];

        [item setImage:iconImg forState:UIControlStateNormal];
    }
    if (icon_selected) {

        UIImage *iconImg = [UIImage imageNamed:icon_selected];
        CGSize size = CGSizeMake(28, 28);

        iconImg = [self image:iconImg byScalingToSize:size];

        [item setImage:iconImg forState:UIControlStateDisabled];
    }
    // 监听点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];

    // 添加item
    [self addSubview:item];

    NSInteger count = self.subviews.count;

    // 默认选中第一个item
    if(count == 1){
        [self itemClick:item];
    }
    // 调整 所有item的frame
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width / count;

    for (int i=0; i<count; i++) {
        QLSTabItem *tabItem = self.subviews[i];
        tabItem.tag = i;
        tabItem.frame = CGRectMake(width * i, 0, width, height);
    }
}



-(void)itemClick:(QLSTabItem *)item{

    // 0:通知代理
    if([_delegate respondsToSelector:@selector(tabbar:to:)] ){
        [_delegate tabbar:self to:item.tag];
    }
    // 取消选中 之前选中的item
    _selectedItem.enabled = YES;

    // 选中点击的item
    item.enabled = NO;

    // 保存当前item状态
    _selectedItem = item;

}

- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;

    UIGraphicsBeginImageContext(targetSize);

    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage ;
}

// Block 方法
//-(void)addButtonWithClickBlock:(void (^)(QLSTabBar *, NSInteger))code andImage:(UIImage *)image andSelectedImage:(UIImage *)imageSelected{
//
//    self.code = code;
//
//    // 创建button
//
//    CZTabBarButton* tabbarBtn = [[CZTabBarButton alloc] init];
//
//    // 设置按钮普通的图片
//    [tabbarBtn setImage:image forState:UIControlStateNormal];
//    // 设置按钮选中的图片
//    [tabbarBtn setImage:imageSelected forState:UIControlStateSelected];
//
//    // 注册一个点击事件(touch down)
//    [tabbarBtn addTarget:self action:@selector(tabbarBtnClick:) forControlEvents:UIControlEventTouchDown];
//
//    // 把创建的btn添加到自定义的view当中
//    [self addSubview:tabbarBtn];
//}

@end
