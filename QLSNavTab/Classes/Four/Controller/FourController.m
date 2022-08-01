//
//  FourViewController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "FourController.h"

@interface FourController ()

@end

@implementation FourController

- (void)viewDidLoad {

    [super viewDidLoad];

    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 200, 60);
    button.center=self.view.center;
    button.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

    [button setTitle:@"第四个控制器" forState:UIControlStateNormal];
    [self.view addSubview:button];

    
    UIButton *btn = [self buttonWithAction:@selector(jumpToFour) andTitle:@"push跳转"];
    btn.center = CGPointMake(kWIDTH/2, 100);

}

-(void)jumpToFour{
    [self.navigationController pushViewController:[[FourController alloc]init] animated:YES];
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
