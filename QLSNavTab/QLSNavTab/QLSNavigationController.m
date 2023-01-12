//
//  QLSNavigationController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSNavigationController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UIImage+Extension.h"

@interface QLSNavigationController ()<UINavigationControllerDelegate>
@property(nonatomic, strong) UIColor *titleColor;
@end

@implementation QLSNavigationController

- (void)setTitleColor:(UIColor *)color{
    _titleColor = color;
    NSDictionary *dict = @{NSForegroundColorAttributeName:_titleColor};
    [self.navigationBar setTitleTextAttributes:dict];
    self.navigationBar.tintColor = _titleColor;
    
    if(@available(iOS 13.0,*)){
        UINavigationBarAppearance *appearance = self.navigationBar.standardAppearance;
        appearance.titleTextAttributes = dict;
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;
    }
}

- (void)setBackgroundColor:(UIColor *)color{
    
    if (@available(iOS 13.0, *)) {
        
        UINavigationBarAppearance *appearance = self.navigationBar.standardAppearance;
        appearance.backgroundColor = color;
        
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;
        
    } else {
        
        [self.navigationBar setBarTintColor:color];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.shadowImage = [[UIImage alloc]init];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    //self - 导航控制器
    if(self.viewControllers.count){
        viewController.hidesBottomBarWhenPushed = YES;
    
        UIImage *backImage;
        if (@available(iOS 13.0, *)) {
            backImage = [UIImage systemImageNamed:@"chevron.backward"];
        }
        if(!backImage){
            backImage = [[UIImage imageNamed:@"icon_back"] scaleToSize:CGSizeMake(30, 30)];
        }
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(onCustomPop:)];

        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                              target:nil action:nil];
        negativeSpacer.width = 15;
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,backItem];
      
        if(self.titleColor){
            [backItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_titleColor} forState:UIControlStateNormal];
        }
    }
    if(self.titleColor){
        [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_titleColor} forState:UIControlStateNormal];
    }

    // 调用系统默认做法
    [super pushViewController:viewController animated:animated];

}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if([viewControllerToPresent isKindOfClass:[UIAlertController class]]){
        [super presentViewController:viewControllerToPresent animated:flag completion:completion];
        return;
    }
    QLSNavigationController *nav = [[QLSNavigationController alloc]initWithRootViewController:viewControllerToPresent];

    UIImage *backImage;
    if (@available(iOS 13.0, *)) {
        backImage = [UIImage systemImageNamed:@"chevron.backward"];
    }
    if(!backImage){
        backImage = [[UIImage imageNamed:@"icon_back"] scaleToSize:CGSizeMake(30, 30)];
    }
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(onCustomDismiss:)];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                          target:nil action:nil];
    /**
        *  width为负数时，相当于btn向右移动width数值个像素，
        由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整为0；
        width为正数时，正好相反，相当于往左移动width数值个像素
         */
    negativeSpacer.width = 15;
    
    viewControllerToPresent.navigationItem.leftBarButtonItems = @[negativeSpacer,backItem];
    
    if(self.titleColor){
        [nav.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_titleColor} forState:UIControlStateNormal];
    }
    // 调用系统默认做法
    [super presentViewController:nav animated:flag completion:completion];
    
}

- (void)onCustomDismiss:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onCustomPop:(id)sender{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
