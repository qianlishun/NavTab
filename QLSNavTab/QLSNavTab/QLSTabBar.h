//
//  QLSTabBar.h
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLSTabItem.h"


@class QLSTabBar;

@protocol QLSTabBarDelegate <NSObject>

@optional
- (void)tabbar:(QLSTabBar *)tabbar to:(NSInteger)to;

@end

@interface QLSTabBar : UIView

//- (void)addButtonWithClickBlock:(void (^)(QLSTabBar *tabbar, NSInteger clickIndex))code andImage:(UIImage *)image andSelectedImage:(UIImage *)imageSelected;


@property (nonatomic,weak) QLSTabItem *selectedItem;


@property (nonatomic,weak) id<QLSTabBarDelegate> delegate;



// 添加tab按钮的方法
-(void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)icon_selected title:(NSString *)title titleColor:(UIColor*)titleColor selectedTitleColor:(UIColor*)selectedTitleColor font:(UIFont*)font;

- (QLSTabItem*)tabItemWithIndex:(NSUInteger)index;

- (void)setSelectedIndex:(NSUInteger)index;
@end

