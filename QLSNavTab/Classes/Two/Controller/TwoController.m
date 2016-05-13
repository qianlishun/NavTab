//
//  TwoViewController.m
//  QLSNavTab
//
//  Created by Mr.Q on 16/5/12.
//  Copyright © 2016年 QLS. All rights reserved.
//

#import "TwoController.h"

@interface TwoController ()

@end

@implementation TwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 200, 60);
    button.center=self.view.center;

    button.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

    [button setTitle:@"第二个控制器" forState:UIControlStateNormal];
    [self.view addSubview:button];

}
@end