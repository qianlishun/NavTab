//
//  OneController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "OneController.h"
#import "FourController.h"
#import "ThreeController.h"

@interface OneController ()

@end

@implementation OneController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"My";

    UIButton *btn = [self buttonWithAction:@selector(jumpToFour) andTitle:@"push跳转"];
    btn.center = CGPointMake(self.view.center.x, 100);

    UIButton *btn2 = [self buttonWithAction:@selector(presentToFour) andTitle:@"模态弹出"];
    btn2.center = CGPointMake(self.view.center.x, 200);

}

-(void)jumpToFour{
    [self.navigationController pushViewController:[[FourController alloc]init] animated:YES];
}

- (void)presentToFour{

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[ThreeController new]];

    [self presentViewController:nav animated:YES completion:nil];
    
}

- (UIButton *)buttonWithAction:(SEL)action andTitle:(NSString *)title{

    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 200, 60);

    button.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];

    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    return button;
}

@end
