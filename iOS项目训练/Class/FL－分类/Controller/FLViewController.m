//
//  FLViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "FLViewController.h"
#import "ClassCollectionView.h"
#import "ClassCollectionModel.h"
#import "EffectClassModel.h"

@interface FLViewController ()

@property(nonatomic , strong)ClassCollectionView *classCollection;
@end

@implementation FLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAl_BackColor;
    [self.view addSubview:self.classCollection];
    WEAKSELF;
    [_classCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self referData];
}
-(void)referData{
    WEAKSELF;
    //功效
    [self getDataFromSever:@"appBrandareatype/findBrandareatype.do" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        weakSelf.classCollection.effectClassArr = [EffectClassModel mj_objectArrayWithKeyValuesArray:project];
        [weakSelf.classCollection reloadData];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"网络错误");
    }];
    //经典
    [self getDataFromSever:@"appBrandarea/asianBrand.do" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        weakSelf.classCollection.classicClassArr = [ClassCollectionModel mj_objectArrayWithKeyValuesArray:project];
        [weakSelf.classCollection reloadData];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"网络连接错误");
    }];
    //推荐
    [self getDataFromSever:@"appBrandareanew/findBrandareanew.do" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        weakSelf.classCollection.recommendClassArr = [ClassCollectionModel  mj_objectArrayWithKeyValuesArray:project];
        [weakSelf.classCollection reloadData];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"没网络");
    }];
}

-(ClassCollectionView *)classCollection{
    if (!_classCollection) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        NSInteger itemWidth = (VIEW_WIDTH - 3) / 4;
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0);
        flowLayout.headerReferenceSize = CGSizeMake(0, 35);
        _classCollection = [[ClassCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        _classCollection.backgroundColor = RGB(245, 245, 245);
    }
    return _classCollection;
}
@end
