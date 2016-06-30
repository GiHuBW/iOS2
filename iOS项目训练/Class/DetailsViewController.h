//
//  DetailsViewController.h
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

/**
 详情页面视图控制器
 */
#import "BaseViewController.h"

@interface DetailsViewController : BaseViewController
/**请求数据的商品ID*/
@property(nonatomic , copy) NSString *goodsID;
@end
