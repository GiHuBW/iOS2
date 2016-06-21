//
//  NavigationController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UINavigationBar *bar = [[UINavigationBar alloc]init];
    [self.navigationBar setBackgroundImage:[[UIImage imageNamed:@"nav_backImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setTitleTextAttributes:@{
                                                         NSFontAttributeName:[UIFont systemFontOfSize:28.0],
                                                         NSForegroundColorAttributeName:[UIColor blackColor]
                                                         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
