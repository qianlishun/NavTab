//
//  ViewController.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "MainController.h"
#import "OneController.h"
#import "TwoController.h"
#import "ThreeController.h"
@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad]; 

//    self.navigationBackgroundColor =  [UIColor colorWithRed:arc4random_uniform (256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    self.navigationBackgroundImage = [UIImage imageNamed:@"NavBar64"];

    self.childControllerAndIconArr = @[

                                       /************第一个控制器配置信息*********************/
                                       @{
                                           VC_VIEWCONTROLLER : [[OneController alloc]init],  //控制器对象
                                           NORMAL_ICON : @"icon_classTable",             //正常状态的Icon 名称
                                           SELECTED_ICON : @"icon_classTable_selected",  //选中状态的Icon 名称
                                           TITLE : @"表"                                 //Nav和Tab的标题
                                           },
                                       /************第二个控制器配置信息*********************/
                                       @{
                                           VC_VIEWCONTROLLER : [[TwoController alloc]init],
                                           NORMAL_ICON : @"icon_me",
                                           SELECTED_ICON : @"icon_me_selected",
                                           TITLE : @"通讯录"
                                           },
                                       @{

                            /*
                                如果在此处使用storyboard,需要给storyboard设置storyboardID
                                storyboardID 与 VC_STORYBOARD的value 同名 此处为Three
                             */
                                           VC_STORYBOARD :@"Three",
                                           NORMAL_ICON : @"icon_discover",
                                           SELECTED_ICON : @"icon_discover_selected",
                                           TITLE : @"发现"
                                           },
                                       
                                       ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
