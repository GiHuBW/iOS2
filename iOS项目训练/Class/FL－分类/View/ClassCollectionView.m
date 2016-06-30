//
//  ClassCollectionView.m
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ClassCollectionView.h"
#import "ClassCollectionViewCell.h"
#import "EffectCollectionViewCell.h"
#import "HeadCollectionReusableView.h"

@interface ClassCollectionView ()<UICollectionViewDelegate , UICollectionViewDataSource>

@end
@implementation ClassCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[EffectCollectionViewCell class] forCellWithReuseIdentifier:@"EffectCollectionViewCell"];
        [self registerClass:[ClassCollectionViewCell class] forCellWithReuseIdentifier:@"ClassCollectionViewCell"];
        [self registerClass:[HeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadCollectionReusableView"];
    }
    return self;
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.effectClassArr.count;
    }
    else if (section == 1){
        return self.classicClassArr.count;
    }
    else
        return self.recommendClassArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *ID = @"EffectCollectionViewCell";
        EffectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        cell.effectModel = _effectClassArr[indexPath.row];
        return cell;
    }
    else{
        static NSString *ID = @"ClassCollectionViewCell";
        ClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        if (indexPath.section == 1) {
            cell.recommedModel = _classicClassArr[indexPath.row];
        }else{
            cell.recommedModel = _recommendClassArr[indexPath.row];
        }
        return cell;
    }
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        static NSString *ID = @"HeadCollectionReusableView";
        HeadCollectionReusableView *sectionHeadView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ID forIndexPath:indexPath];
        if (indexPath.section == 0) {
            sectionHeadView.titleLabelText = @"功效分类";
            sectionHeadView.backgroundColor = RGB(239, 248, 251);
        }
        else if (indexPath.section == 1){
            sectionHeadView.titleLabelText = @"经典品牌";
            sectionHeadView.backgroundColor = RGB(252, 244, 243);
        }
        else{
            sectionHeadView.titleLabelText = @"推荐品牌";
            sectionHeadView.backgroundColor = RGB(252, 244, 243);
        }
        return sectionHeadView;
    }
    return nil;
}
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_selecteCellBlock) {
        _selecteCellBlock([self makeParameterDic:indexPath]);
    }
}
- (NSDictionary *)makeParameterDic:(NSIndexPath *)indexPath{
    NSDictionary *dic = nil;
    if (indexPath.section == 0) {
        dic = @{@"ShopID":[_effectClassArr[indexPath.row] GoodsType],@"Type":@"TypeId",@"URL":@"classifyApp/appTypeGoodsList.do"};
    }else if (indexPath.section == 1){
        dic = @{@"ShopID":[_classicClassArr[indexPath.row] ShopId],@"Type":@"ShopId",@"URL":@"appShop/appShopGoodsList.do"};
    }else{
        dic = @{@"ShopID":[_recommendClassArr[indexPath.row] ShopId],@"Type":@"ShopId",@"URL":@"appShop/appShopGoodsList.do"};
    }
    return dic;
}

@end
