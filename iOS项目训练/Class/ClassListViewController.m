//
//  ClassListViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ClassListViewController.h"
#import "ClassListFourButtonView.h"
#import "ClassListCollectionViewCell.h"
#import "ClassListCollectionView.h"
#import "ClassListViewModel.h"
#import "DetailsViewController.h"

@interface ClassListViewController ()
@property(nonatomic ,strong) ClassListFourButtonView *fourButtonView;
@property(nonatomic ,strong) ClassListCollectionView *collectionView;
@end

@implementation ClassListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.fourButtonView];
    [self.view addSubview:self.collectionView];
    self.edgesForExtendedLayout = 0;
    [self addLayoutWithControl];
    NSDictionary *dic = @{@"OrderName":@"host",@"OrderType":@"DESC",_idDictionary[@"keyword"]:_idDictionary[@"ID"]};
    [self reloadData:dic];
    
}
- (void)addLayoutWithControl{
    __weak typeof (self) weakSelf = self;
    [_fourButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf.view);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH, 30));
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.fourButtonView.mas_bottom);
    }];
}


-(void)reloadData:(NSDictionary *)parameter{
    if ([_idDictionary[@"keyword"] isEqualToString:@"search"]) {
        [self postDataFromSever:_idDictionary[@"URL"]
                      parameter:[self makeParameterDic:parameter]
                      isSuccess:^(NSURLSessionDataTask *task, id project) {
                          
                          _collectionView.classListArray = [ClassListViewModel mj_objectArrayWithKeyValuesArray:project];
                          [_collectionView reloadData];
                      } isError:^(NSURLSessionDataTask *task, NSError *error) {
                          
                      }];
    }else{
        [self getDataFromSever:_idDictionary[@"URL"]
                     parameter:[self makeParameterDic:parameter]
                     isSuccess:^(NSURLSessionDataTask *task, id project) {
                         
                         _collectionView.classListArray = [ClassListViewModel mj_objectArrayWithKeyValuesArray:project];
                         [_collectionView reloadData];
                     } isError:^(NSURLSessionDataTask *task, NSError *error) {
                         
                     }];
    }
}
- (NSDictionary *)makeParameterDic:(NSDictionary *)dict{
    //@"OrderName":@"host",@"OrderType":@"DESC",@"ShopId":self.shopID
    NSDictionary *parameter = @{@"OrderName":dict[@"OrderName"],@"OrderType":dict[@"OrderType"],_idDictionary[@"keyword"]:_idDictionary[@"ID"]};
    return parameter;
}

-(ClassListCollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
        NSInteger itemWidth = (WIDTH - 10)/2;
        flowlayout.itemSize = CGSizeMake(itemWidth, itemWidth/0.618);
        _collectionView = [[ClassListCollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowlayout];
        _collectionView.backgroundColor = RGB(248, 248, 248);
        WEAKSELF;
        _collectionView.selectedGoods = ^(NSString *goodsID){
             [weakSelf pushToDetailsViewController:goodsID];
        };
    }
    return _collectionView;
}
- (void)pushToDetailsViewController:(NSString *)goodsID{
    DetailsViewController *detailsViewController = [[DetailsViewController alloc]init];
    detailsViewController.goodsID = goodsID;
    detailsViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

-(ClassListFourButtonView *)fourButtonView{
    if (!_fourButtonView) {
        _fourButtonView = [[ClassListFourButtonView alloc]init];
        WEAKSELF;
        _fourButtonView.parameterDictionary = ^(NSDictionary *paramentDic){
            [weakSelf reloadData:paramentDic];
        };
    }
    return _fourButtonView;
}

-(NSMutableDictionary *)idDictionary{
    if (!_idDictionary) {
        _idDictionary = [NSMutableDictionary dictionary];
    }
    return _idDictionary;
}
@end
