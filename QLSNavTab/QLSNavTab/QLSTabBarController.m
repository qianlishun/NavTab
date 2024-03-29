//
//  QLSTabBarController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSTabBarController.h"
#import "QLSNavigationController.h"

static float originTabbarHeight = 50;

@interface QLSTabBarController ()<QLSTabBarDelegate>

@end

@implementation QLSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.tabBar && [keyPath isEqualToString:@"frame"]) {
        //        NSLog(@"old frame =%@", [change valueForKey:NSKeyValueChangeOldKey]);
        //        NSLog(@"new frame = %@", [self.tabBar valueForKey:@"frame"]);
        CGRect oldFrame = [[change valueForKey:NSKeyValueChangeOldKey] CGRectValue];
        CGRect newFrame = [[self.tabBar valueForKey:@"frame"] CGRectValue];
        
        if (oldFrame.size.height != newFrame.size.height) {
            if (oldFrame.size.height > newFrame.size.height) {
                self.tabBar.frame = oldFrame;
            } else {
                self.tabBar.frame = newFrame;
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
}

#pragma mark 初始化TabBar
-(void)initTabBar{
    if(theTabBar){
        [theTabBar removeFromSuperview];
    }
    if(!self.tabbarHeight || self.tabbarHeight<50){
        self.tabbarHeight = 50;
    }
    CGRect frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabbarHeight);
    QLSTabBar *tabBar = [[QLSTabBar alloc]initWithFrame:frame];
    tabBar.tag = -1001;
    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar];
    
    theTabBar = tabBar;
    
}

#pragma mark tabBar的代理方法
- (void)tabbar:(QLSTabBar *)tabbar to:(NSInteger)to{
    
    if (to < 0 || to >= self.childViewControllers.count||self.selectedIndex==to) return;
    
    self.selectedIndex = to;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    UIViewController *newVc = self.childViewControllers[selectedIndex];
    
    CGFloat width = self.view.frame.size.width;
    
    CGFloat height = self.view.frame.size.height;
    
    newVc.view.frame = CGRectMake(0,0, width, height);
    
    [theTabBar setSelectedIndex:selectedIndex];
    [self.tabBar bringSubviewToFront:theTabBar];
    
    [super setSelectedIndex:selectedIndex];
    
    
}


-(void)setChildControllerAndIconArr:(NSArray *)childControllerAndIconArr{
    
    if(_childControllerAndIconArr){
        for (UIViewController *vc in _childControllerAndIconArr) {
            [vc removeFromParentViewController];
        }
    }
    
    [self initTabBar];
    
    _childControllerAndIconArr=childControllerAndIconArr;
    
    //遍历配置字典
    for (NSInteger i = 0; i < childControllerAndIconArr.count; i++) {
        
        //取出字典
        NSDictionary *dict=childControllerAndIconArr[i];
        
        
        // 创建导航控制器
        QLSNavigationController *nav;
        
        if ([dict objectForKey:TAB_VC_VIEWCONTROLLER]) {
            nav=[[QLSNavigationController alloc]initWithRootViewController:[dict objectForKey:TAB_VC_VIEWCONTROLLER]];
        }
        if ([dict objectForKey:TAB_VC_STORYBOARD]) {
            
            UIStoryboard *sb = [UIStoryboard storyboardWithName:[dict objectForKey:TAB_VC_STORYBOARD] bundle:[NSBundle mainBundle]];
            
            UIViewController *vc = [sb instantiateViewControllerWithIdentifier:[dict objectForKey:TAB_VC_STORYBOARD]];
            
            nav = [[QLSNavigationController alloc]initWithRootViewController:vc];
            
        }

        if (self.navigationBackgroundColor) {
            [nav setBackgroundColor:self.navigationBackgroundColor];
        }
        if(self.navTitleColor){
            [nav setTitleColor:self.navTitleColor];
        }

        if (self.navigationBackgroundImage) {
            [nav.navigationBar setBackgroundImage:self.navigationBackgroundImage forBarMetrics:UIBarMetricsDefault];
        }
        
        [self addChildViewController:nav];
        
        [theTabBar addItemWithIcon:[dict objectForKey:TAB_NORMAL_ICON] selectedIcon:[dict objectForKey:TAB_SELECTED_ICON]  title:[dict objectForKey:TAB_TITLE] titleColor:[dict objectForKey:TAB_TITLE_COLOR] selectedTitleColor:[dict objectForKey:TAB_TITLE_COLOR_SEL] font:self.tabbarFont separatorColor:self.itemSeparatorColor];
        
    }
    [self setTabbarBackgroundColor:self.tabbarBackgroundColor];
    if(self.topSeparatorColor){
        [theTabBar setTopSeparatorColor:self.topSeparatorColor];
    }
}

-(void)setNavigationBackgroundColor:(UIColor *)navigationBackgroundColor{
    _navigationBackgroundColor = navigationBackgroundColor;
}

- (void)setTabbarBackgroundColor:(UIColor *)tabbarBackgroundColor{
    _tabbarBackgroundColor = tabbarBackgroundColor;
    self.tabBar.backgroundColor = self.tabbarBackgroundColor;
    theTabBar.backgroundColor = self.tabbarBackgroundColor;
    if (@available (iOS 15.0, *)) {
        // iOS 15.0 及以上
        UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
        [appearance configureWithOpaqueBackground];
        appearance.backgroundColor = self.tabbarBackgroundColor;
        
        self.tabBar.standardAppearance = appearance;
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance;
    } else {
        self.tabBar.barTintColor = self.tabbarBackgroundColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGFloat bottomMargin = self.view.bounds.size.height - originTabbarHeight-self.tabBar.frame.origin.y;
    CGRect frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.size.height-self.tabbarHeight-bottomMargin, self.tabBar.frame.size.width, self.tabbarHeight);
    [theTabBar setFrame:frame];
    
    // 删除self.tabBar中的子控件 除了自定义tabBar
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[QLSTabBar class]] &&
            childView.tag != -999) {
            [childView removeFromSuperview];
        }
    }
    
}

-(void)dealloc{
    [self.tabBar removeObserver:self forKeyPath:@"frame" context:nil];
}
@end
