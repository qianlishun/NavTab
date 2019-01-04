//
//  QLSTabBarController.h
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLSTabBar.h"

#define VC_VIEWCONTROLLER @"VC"

#define VC_STORYBOARD @"SB"

#define NORMAL_ICON @"ICONOR"

#define  SELECTED_ICON @"ICONSE"

#define TITLE @"TITLE"

@interface QLSTabBarController : UITabBarController{
    @public
    QLSTabBar *theTabBar;

}

/** 子控制信息数组 */
@property (nonatomic,strong) NSArray *childControllerAndIconArr;

/** 设置 nav 背景色 */
@property (nonatomic,strong) UIColor *navigationBackgroundColor;

/** 设置 nav 背景图片 */
@property (nonatomic,strong) UIImage *navigationBackgroundImage;

@end
