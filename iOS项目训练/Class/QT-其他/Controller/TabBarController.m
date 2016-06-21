//
//  TabBarController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "TabBarItemModel.h"


@interface TabBarController ()
@property (nonatomic , strong)NSArray *tabBarItemArray;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //用来存放NavigationController
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_back"]];
    NSMutableArray *navControllers = [NSMutableArray arrayWithCapacity:self.tabBarItemArray.count];
    [self.tabBarItemArray enumerateObjectsUsingBlock:^(NSDictionary  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //将字典转模型
        TabBarItemModel *tabBarItem = [TabBarItemModel tabBarItemWithDic:obj];
        //将字符串转化为对应的类名
        Class viewController = NSClassFromString(tabBarItem.viewController);
        UIViewController *vc = [[viewController alloc]init];
        //设置对应UIViewController的tabBarItem
        vc.title = tabBarItem.title;
        vc.tabBarItem.image = [[UIImage imageNamed:tabBarItem.image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarItem.selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //将UINavigationController的跟视图设置为对应的UIViewController
        NavigationController *naV = [[NavigationController alloc]initWithRootViewController:vc];
        //将创建的 NavigationController放入数组
        [navControllers addObject:naV];
    }];
    //自定义属性字符串
    [[UITabBarItem appearance]setTitleTextAttributes:@{
                                                      NSFontAttributeName:[UIFont systemFontOfSize:10.0],
                                                      NSForegroundColorAttributeName:[UIColor grayColor]
                                                      }forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{
                                                         NSFontAttributeName:[UIFont systemFontOfSize:10.0],
                                                         NSForegroundColorAttributeName:RGB(65, 179, 241)
                                                             
                                                         }forState:UIControlStateSelected];
      //将创建的视图控制器放入UITabBarController
    self.viewControllers = navControllers;
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSArray *)tabBarItemArray{
    if (!_tabBarItemArray) {
        _tabBarItemArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TabBarControllers.plist" ofType:nil]];
    }
    return _tabBarItemArray;
}

//另一种自定义字符串的方法
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[NSFontAttributeName] = [UIFont systemFontOfSize:10.0];
//    dic[NSForegroundColorAttributeName] = [UIColor yellowColor];
//    [[UITabBarItem appearance] setTitleTextAttributes:dic forState:UIControlStateNormal];

@end
