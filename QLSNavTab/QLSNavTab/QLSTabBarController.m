//
//  QLSTabBarController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSTabBarController.h"
#import "QLSNavigationController.h"

@interface QLSTabBarController ()<QLSTabBarDelegate>

@end

@implementation QLSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initTabBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    // 删除self.tabBar中的子控件 除了自定义tabBar
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[QLSTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

#pragma mark 初始化TabBar
-(void)initTabBar{

    QLSTabBar *tabBar = [[QLSTabBar alloc]initWithFrame:self.tabBar.bounds];
    tabBar.delegate = self;

    [self.tabBar addSubview:tabBar];

    theTabBar = tabBar;
    
}

#pragma mark tabBar的代理方法
- (void)tabbar:(QLSTabBar *)tabbar to:(NSInteger)to{

    if (to < 0 || to >= self.childViewControllers.count||self.selectedIndex==to) return;

    UIViewController *newVc = self.childViewControllers[to];

    CGFloat width = self.view.frame.size.width;

    CGFloat height = self.view.frame.size.height;

    newVc.view.frame = CGRectMake(0,0, width, height);

    self.selectedIndex=to;

    [self.tabBar bringSubviewToFront:theTabBar];
    
}



-(void)setChildControllerAndIconArr:(NSArray *)childControllerAndIconArr{

    _childControllerAndIconArr=childControllerAndIconArr;

    //遍历配置字典
    for (NSInteger i = 0; i < childControllerAndIconArr.count; i++) {

        //取出字典
        NSDictionary *dict=childControllerAndIconArr[i];


        // 创建导航控制器
        QLSNavigationController *nav;

        if ([dict objectForKey:VC_VIEWCONTROLLER]) {
            nav=[[QLSNavigationController alloc]initWithRootViewController:[dict objectForKey:VC_VIEWCONTROLLER]];
        }
        if ([dict objectForKey:VC_STORYBOARD]) {

            UIStoryboard *sb = [UIStoryboard storyboardWithName:[dict objectForKey:VC_STORYBOARD] bundle:[NSBundle mainBundle]];

            UIViewController *vc = [sb instantiateViewControllerWithIdentifier:[dict objectForKey:VC_STORYBOARD]];

            nav = [[QLSNavigationController alloc]initWithRootViewController:vc];

        }
        if (self.navigationBackgroundColor) {
            [nav.navigationBar setBarTintColor:self.navigationBackgroundColor];
        }
        if (self.navigationBackgroundImage) {
            [nav.navigationBar setBackgroundImage:self.navigationBackgroundImage forBarMetrics:UIBarMetricsDefault];
        }

        [self addChildViewController:nav];

        [theTabBar addItemWithIcon:[dict objectForKey:NORMAL_ICON] selectedIcon:[dict objectForKey:SELECTED_ICON]  title:[dict objectForKey:TITLE]];
        
    }
}



-(void)setNavigationBackgroundColor:(UIColor *)navigationBackgroundColor{
    _navigationBackgroundColor = navigationBackgroundColor;
}

- (void)setNavigationBackgroundImage:(UIImage *)navigationBackgroundImage{
    _navigationBackgroundImage = navigationBackgroundImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [theTabBar setFrame:self.tabBar.bounds];
}
@end
