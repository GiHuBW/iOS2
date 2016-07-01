//
//  ClassListCollectionView.m
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ClassListCollectionView.h"
#import "ClassListCollectionViewCell.h"

@interface ClassListCollectionView ()<UICollectionViewDelegate ,UICollectionViewDataSource>

@end
@implementation ClassListCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ClassListCollectionViewCell class] forCellWithReuseIdentifier:@"ClassListCollectionViewCell"];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.classListArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ClassListCollectionViewCell";
    ClassListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell sizeToFit];
    cell.classModel = self.classListArray[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectedGoods) {
        _selectedGoods([_classListArray[indexPath.row] GoodsId]);
    }
}

@end
