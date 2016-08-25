# QLSNavTab
  NavigationController + UITabBarController框架
  
* 可自定义 tabbar 图标,设置 nav 背景色
* 支持添加 storyBoard 
* icon 图标大小自适应,只要图标比例是1:1,就会自动调整适合 tabbar 的大小, 但是尽量使用50*50的尺寸,因为自动缩放较耗性能.
  (好像还是有问题,尽量使用50*50尺寸)

###效果图:

<img src="http://images2015.cnblogs.com/blog/905396/201605/905396-20160513175048093-287234252.png" alt="" width="231" height="426" />   <img src="http://images2015.cnblogs.com/blog/905396/201605/905396-20160513175126421-1618180204.png" alt="" width="231" height="426" />

####简介
1>  在AppDelegate中 设置MainController为主控制器

2>  在主控制器 MainController 中
* (MainController 继承于QLSTabBarController)

①设置Nav背景色,设置 Nav 背景图片

  * self.navigationBackgroundColor = ...
  * self.navigationBackgroundImage = ...(如果已设置了背景色,则背景图不生效)

②设置子控制器数组

    self.childControllerAndIconArr = @[

                                       /************第一个控制器配置信息*********************/
                                       @{
                                           VC_VIEWCONTROLLER : [[OneController alloc]init],  //控制器对象
                                           NORMAL_ICON : @"icon_classTable",             //正常状态的Icon 名称
                                           SELECTED_ICON : @"icon_classTable_selected",  //选中状态的Icon 名称
                                           TITLE : @"表"                                 //Nav和Tab的标题
                                           },
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
