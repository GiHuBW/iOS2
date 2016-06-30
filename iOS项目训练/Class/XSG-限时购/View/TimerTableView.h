//
//  TimerTableView.h
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectSingleBlock)(NSString *goodsID);
typedef void(^selectGroupBlock)(NSString *ActivityId);

@interface TimerTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

/**
 存放单品团列表数据的数组
 */
@property (strong, nonatomic) NSArray *singleListArray;

/**
 存放品牌团列表数据的数组
 */
@property (strong, nonatomic) NSArray *groupBuyListArray;

/**
 告诉tableview展示单品团列表还是品牌团列表，yes为单品团列表，no为品牌团
 */
@property (assign, nonatomic) BOOL isSingle;
/**传入商品ID*/
@property (copy, nonatomic) selectSingleBlock singleBlock;
/**传入活动ID*/
@property (copy, nonatomic) selectGroupBlock groupBlock;

@end
