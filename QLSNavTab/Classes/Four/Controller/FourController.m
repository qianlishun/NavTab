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

}
@end
