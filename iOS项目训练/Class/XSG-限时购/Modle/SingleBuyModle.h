//
//  SingleBuyModle.h
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleBuyModle : NSObject
/*
 商品ID ： GoodsId
 国家名称 ： CountryName
 国旗图片 ： CountryImg
 缩略图 ：ImgView
 购买数量 ： BuyCount
 折扣 ：Discount
 商品名称：Title
 外币价格：ForeignPrice
 人民币价格：Price
 其他价格 ：OtherPrice
 活动时间（距离结束时间） ：RestTime
 库存 ：Stock
 当前价格 ：DomesticPrice
 商品描述：GoodsIntro
 商品简称：Abbreviation
 */
/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;

/**国家图片*/
@property (copy, nonatomic) NSString *CountryImg;

/**缩略图*/
@property (copy, nonatomic) NSString *ImgView;

/**折扣*/
@property (copy, nonatomic) NSString *Discount;

/**商品名称*/
@property (copy, nonatomic) NSString *Title;

/**外币价格*/
@property (copy, nonatomic) NSString *ForeignPrice;

/**当前价格*/
@property (copy, nonatomic) NSString *Price;

/**原价格*/
@property (copy, nonatomic) NSString *DomesticPrice;

/**商品描述*/
@property (copy, nonatomic) NSString *GoodsIntro;

@end
