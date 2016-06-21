//
//  TabBarItemModel.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TabBarItemModel.h"

@implementation TabBarItemModel
+(instancetype)tabBarItemWithDic:(NSDictionary *)dic{
    TabBarItemModel *tabBar = [[TabBarItemModel alloc]init];
    [tabBar setValuesForKeysWithDictionary:dic];
    return tabBar;
}
@end
