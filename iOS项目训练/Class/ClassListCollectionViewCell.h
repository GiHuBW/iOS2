//
//  ClassListCollectionViewCell.h
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassListViewModel.h"

@interface ClassListCollectionViewCell : UICollectionViewCell
@property(nonatomic , strong) ClassListViewModel *classModel;
@end
