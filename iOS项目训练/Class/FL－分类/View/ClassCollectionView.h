//
//  ClassCollectionView.h
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedCollectionCell)(NSDictionary *);

@interface ClassCollectionView : UICollectionView

@property(nonatomic , copy)SelectedCollectionCell selecteCellBlock;
@property(nonatomic , strong)NSArray *classicClassArr;
@property(nonatomic , strong)NSArray *recommendClassArr;
@property(nonatomic , strong)NSArray *effectClassArr;

@end
