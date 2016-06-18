//
//  OneController.m
//  QLSNavTab
//
//  Created by Mr.Q on 16/5/12.
//  Copyright © 2016年 QLS. All rights reserved.
//

#import "OneController.h"
#import "FourController.h"

@interface OneController ()

@end

@implementation OneController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"My";
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 200, 60);
    button.center=self.view.center;

    button.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];


    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    [self.view addSubview:button];

    [button addTarget:self action:@selector(jumpToFour) forControlEvents:UIControlEventTouchUpInside];


}

-(void)jumpToFour{
    [self.navigationController pushViewController:[[FourController alloc]init] animated:YES];
}


@end
