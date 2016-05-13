# QLSNavTab
  NavTab框架
####简介

效果图:<img src="http://images2015.cnblogs.com/blog/905396/201605/905396-20160513175048093-287234252.png" alt="" width="231" height="426" /><img src="http://images2015.cnblogs.com/blog/905396/201605/905396-20160513175126421-1618180204.png" alt="" width="231" height="426" />


1> 在AppDelegate中 设置MainController为主控制器

2 >在主控制器 MainController 中
    
    // 设置Nav背景色
    self.navigationBackgroundColor =  [UIColor colorWithRed:arc4random_uniform (256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    // 设置子控制器数组
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
