//
//  QLSNavigationController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSNavigationController.h"

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
    }
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.topViewController.navigationItem.backBarButtonItem = backItem;

    if(self.titleColor){
        [self.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_titleColor} forState:UIControlStateNormal];
    }

    // 调用系统默认做法
    [super pushViewController:viewController animated:animated];

}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    QLSNavigationController *nav = [[QLSNavigationController alloc]initWithRootViewController:viewControllerToPresent];

    if (@available(iOS 13.0, *)) {
        viewControllerToPresent.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"chevron.backward"] style:UIBarButtonItemStylePlain target:self action:@selector(onCustomDismiss:)];
    } else {
        viewControllerToPresent.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(onCustomDismiss:)];
    }

    if(self.titleColor){
        [nav.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_titleColor} forState:UIControlStateNormal];
    }
    // 调用系统默认做法
    [super presentViewController:nav animated:flag completion:completion];
    
}

- (void)onCustomDismiss:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
