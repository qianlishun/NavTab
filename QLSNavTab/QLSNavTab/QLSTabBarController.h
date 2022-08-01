//
//  QLSTabBarController.h
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLSTabBar.h"
 
static NSString *TAB_VC_VIEWCONTROLLER = @"VC";

static NSString * TAB_VC_STORYBOARD = @"SB";

static NSString * TAB_NORMAL_ICON = @"ICONOR";

static NSString *  TAB_SELECTED_ICON = @"ICONSE";

static NSString * TAB_TITLE = @"TITLE";

static NSString * TAB_TITLE_COLOR = @"TITLE_COLOR";

static NSString * TAB_TITLE_COLOR_SEL = @"TITLE_COLOR_SEL";

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

/** 设置 nav 背景色 */
@property(nonatomic, strong) UIColor *tabbarBackgroundColor;

/** 设置 nav title 字体颜色 */
@property(nonatomic, strong) UIColor *navTitleColor;

/** 自定义 tabbar 高度*/
@property(nonatomic, assign) CGFloat tabbarHeight;

@end
