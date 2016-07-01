//
//  ClassListCollectionView.h
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedGoodsID)(NSString *);

@interface ClassListCollectionView : UICollectionView

@property(nonatomic , strong)NSArray *classListArray;
@property(nonatomic ,copy)selectedGoodsID selectedGoods;

@end
