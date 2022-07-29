//
//  QLSTabBar.m
//  QLSNavTab
//
//  Created by Mr.Q on 15/9/17.
//  Copyright © 2015年 QLS. All rights reserved.
//

#import "QLSTabBar.h"

@interface QLSTabBar ()
@property(nonatomic, strong) NSMutableArray *tabItems;
@end

@implementation QLSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tabItems = [NSMutableArray array];
    }
    return self;
}
- (void)test:(id)sender{
    NSLog(@"test");
}
-(void)addItemWithIcon:(id)icon selectedIcon:(id)icon_selected title:(NSString *)title titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor{

    QLSTabItem *item = [[QLSTabItem alloc]init];

   // 文字
    if (title) {
        [item setTitle:title forState:UIControlStateNormal];
        if(!titleColor)
            titleColor = [UIColor lightGrayColor];
        if(!selectedTitleColor){
            selectedTitleColor = [UIColor blackColor];
        }
        [item setTitleColor:titleColor forState:UIControlStateNormal];
        [item setTitleColor:selectedTitleColor forState:UIControlStateDisabled];
    }
    // 图标
    if (icon) {
        UIImage *iconImg = [self getImageFrom:icon];

        [item setImage:iconImg forState:UIControlStateNormal];
    }
    if (icon_selected) {

        UIImage *iconImg = [self getImageFrom:icon_selected];

        [item setImage:iconImg forState:UIControlStateDisabled];
    }

    // 监听点击
    [item addTarget:self action:@selector(onItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加item
    [self addSubview:item];
    [_tabItems addObject:item];

    NSInteger count = self.subviews.count;

    // 默认选中第一个item
    if(count == 1){
        [self onItemClick:item];
    }
    // 调整 所有item的frame
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width / count;

    for (int i=0; i<count; i++) {
        QLSTabItem *tabItem = self.subviews[i];
        tabItem.tag = i;
        tabItem.frame = CGRectMake(width * i, 0, width, height);
    }
    
}


- (void)onItemClick:(QLSTabItem *)item{

    NSLog(@"on click");
    // 通知代理
    if([_delegate respondsToSelector:@selector(tabbar:to:)] ){
        [_delegate tabbar:self to:item.tag];
    }
    self.selectedItem = item;
}

- (void)setSelectedItem:(QLSTabItem *)selectedItem{
    if(_selectedItem){
        // 取消选中 之前选中的item
        _selectedItem.enabled = YES;
    }
    // 选中点击的item
    selectedItem.enabled = NO;

    // 保存当前item状态
    _selectedItem = selectedItem;
}

- (QLSTabItem *)tabItemWithIndex:(NSUInteger)index{
    if(index >= 0 && index < _tabItems.count)
        return _tabItems[index];
    return nil;
}

- (void)setSelectedIndex:(NSUInteger)index{
    QLSTabItem *item = [self tabItemWithIndex:index];
    if(item){
        self.selectedItem = item;
    }
}

- (UIImage *)getImageFrom:(id)imageInfo {
    UIImage *image = nil;
    if ([imageInfo isKindOfClass:[NSString class]]) {
        CGSize size = CGSizeMake(44, 44);
        image = [UIImage imageNamed:imageInfo];
        image = [self image:image byScalingToSize:size];
    } else if ([imageInfo isKindOfClass:[UIImage class]]) {
        image = (UIImage *)imageInfo;
    }
    return image;
}

- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;

    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [UIScreen mainScreen].scale);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage ;
}

// Block 方法
//-(void)addButtonWithClickBlock:(void (^)(QLSTabBar *, NSInteger))code andImage:(UIImage *)image andSelectedImage:(UIImage *)imageSelected{
//
//    self.code = code;
//
//    // 创建button
//
//    CZTabBarButton* tabbarBtn = [[CZTabBarButton alloc] init];
//
//    // 设置按钮普通的图片
//    [tabbarBtn setImage:image forState:UIControlStateNormal];
//    // 设置按钮选中的图片
//    [tabbarBtn setImage:imageSelected forState:UIControlStateSelected];
//
//    // 注册一个点击事件(touch down)
//    [tabbarBtn addTarget:self action:@selector(tabbarBtnClick:) forControlEvents:UIControlEventTouchDown];
//
//    // 把创建的btn添加到自定义的view当中
//    [self addSubview:tabbarBtn];
//}

@end
