//
//  GroupBuyModel.h
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuyModel : NSObject
/*
 活动ID ： ActivityId
 图片地址 ： ImgView
 是否有中间页：IfMiddlePage
 品牌LOGO图片地址 ： LogoImg
 品牌名称 ： ShopTitle
 活动简介 ：Content
 活动时间（距离结束时间） ：ActivityDate
 */

/**活动ID*/
@property (copy, nonatomic) NSString *ActivityId;

/**图片地址*/
@property (copy, nonatomic) NSString *ImgView;

/**品牌名称*/
@property (copy, nonatomic) NSString *ShopTitle;

/**品牌简介*/
@property (copy, nonatomic) NSString *Content;

@end
