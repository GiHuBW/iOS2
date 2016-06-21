//
//  TabBarItemModel.h
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabBarItemModel : NSObject

@property(nonatomic , copy)NSString *title;
@property(nonatomic , copy)NSString *image;
@property(nonatomic , copy)NSString *selectedImage;
@property(nonatomic , copy)NSString *viewController;
+(instancetype)tabBarItemWithDic:(NSDictionary *)dic;
@end
