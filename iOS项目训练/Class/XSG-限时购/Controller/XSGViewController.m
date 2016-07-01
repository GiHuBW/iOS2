//
//  XSGViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "XSGViewController.h"
#import "ScrollViewModel.h"
#import "TwoButtonView.h"
#import "SingleBuyModle.h"
#import "GroupBuyModel.h"
#import "TimerTableView.h"
#import "DetailsViewController.h"
#import "SearchViewController.h"
#import "ClassListViewController.h"

@interface XSGViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>
@property(nonatomic , strong)UIScrollView *mainScrollView;
@property(nonatomic , strong)SDCycleScrollView *headImageView;
@property(nonatomic , strong)TwoButtonView *twoButtonView;
@property(nonatomic , strong)TimerTableView *singleTableView;
@property(nonatomic , strong)TimerTableView *groupTableView;
@property(nonatomic , strong)UIBarButtonItem *searchButoonItem;
@end

@implementation XSGViewController

-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = GLOBAl_BackColor;
    self.navigationItem.rightBarButtonItem = self.searchButoonItem;
    [self.view addSubview:self.mainScrollView];
    WEAKSELF;
    [_mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.mainScrollView addSubview:self.headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mainScrollView.mas_left);
//        make.right.equalTo(weakSelf.mainScrollView.mas_right);
        make.top.equalTo(weakSelf.mainScrollView.mas_top);
//        make.height.equalTo(230);
        make.size.equalTo(CGSizeMake(WIDTH, 230));
    }];
    [self.mainScrollView addSubview:self.singleTableView];
    [self.mainScrollView addSubview:self.groupTableView];
    [self.mainScrollView addSubview:self.twoButtonView];
//    [_twoButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.headImageView.mas_bottom);
//        make.width.equalTo(WIDTH);
//        make.height.equalTo(50);
//    }];
    [self referHeadImgeView];
}
-(void)referHeadImgeView{
    WEAKSELF;
    //请求轮播图片
    [self getDataFromSever:@"appHome/appHome.do" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSArray *model = [ScrollViewModel mj_objectArrayWithKeyValuesArray:project];
        NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:model.count];
        for (ScrollViewModel *user in model) {
            [imageArray addObject:user.ImgView];
        }
        weakSelf.headImageView.imageURLStringsGroup = [NSArray arrayWithArray:imageArray];
        
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"--------error : %@",error);
    }];
    //请求新品团购
    [self getDataFromSever:@"appActivity/appHomeGoodsList.do" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSArray *model = [SingleBuyModle mj_objectArrayWithKeyValuesArray:project];
        weakSelf.singleTableView.singleListArray = model;
        //修改scrol的滑动范围
        weakSelf.mainScrollView.contentSize = CGSizeMake(0, model.count*170+280);
        //改变table的大小，使table不能进行滚动
        CGRect singleRect = _singleTableView.frame;
        singleRect.size.height = model.count * 170;
        _singleTableView.frame = singleRect;
        [weakSelf.singleTableView reloadData];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"--------error : %@",error);
    }];
    //请求品牌团购
    [self getDataFromSever:@"appActivity/appActivityList.do" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSArray *model = [GroupBuyModel mj_objectArrayWithKeyValuesArray:project];
        weakSelf.groupTableView.groupBuyListArray = model;
        CGRect groupRect = _groupTableView.frame;
        groupRect.size.height = model.count * 175;
        _groupTableView.frame = groupRect;
        
        [weakSelf.groupTableView reloadData];
        
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"--------error : %@",error);
    }];


}
-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc]init];
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        //遵守UIScrollView代理
        _mainScrollView.delegate = self;
    }
    return _mainScrollView;
}
-(SDCycleScrollView *)headImageView{
    if (!_headImageView) {
        _headImageView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 230) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _headImageView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _headImageView.currentPageDotColor = [UIColor whiteColor];
    }
    return _headImageView;
}
/**
 新品团购和品牌团购的两个Button
 */
-(TwoButtonView *)twoButtonView{
    if (!_twoButtonView) {
        _twoButtonView = [[TwoButtonView alloc]initWithFrame:CGRectMake(0, 230, WIDTH, 50)];
//        _twoButtonView.singleButton.selected = YES;
    [_twoButtonView.singleButton addTarget:self action:@selector(twoButtonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [_twoButtonView.groupBuyButton addTarget:self action:@selector(twoButtonMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _twoButtonView;
}
/**
 切换新品团购与品牌团购的方法
 */
- (void)twoButtonMethod:(UIButton *)sender{
    if (sender == _twoButtonView.singleButton) {
        _twoButtonView.singleButton.selected = YES;
        _twoButtonView.groupBuyButton.selected = NO;
        _mainScrollView.contentSize = CGSizeMake(0, _singleTableView.singleListArray.count*170+280);
        [UIView animateWithDuration:0.5 animations:^{
            CGRect singleRect = _singleTableView.frame;
            singleRect.origin.x = 0;
            _singleTableView.frame = singleRect;
            
            CGRect groupRect = _groupTableView.frame;
            groupRect.origin.x = WIDTH;
            _groupTableView.frame = groupRect;
        }];
    }else{
        _twoButtonView.singleButton.selected = NO;
        _twoButtonView.groupBuyButton.selected = YES;
        _mainScrollView.contentSize = CGSizeMake(0, _groupTableView.groupBuyListArray.count*175+280);
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect singleRect = _singleTableView.frame;
            singleRect.origin.x = -VIEW_WIDTH;
            _singleTableView.frame = singleRect;
            
            CGRect groupRect = _groupTableView.frame;
            groupRect.origin.x = 0;
            _groupTableView.frame = groupRect;
        }];
    }
}


/**
 * 新品团购
 */
-(TimerTableView *)singleTableView{
    if (!_singleTableView) {
        _singleTableView = [[TimerTableView alloc]initWithFrame:CGRectMake(0, 280, WIDTH, 0) style:UITableViewStylePlain];
        _singleTableView.isSingle = YES;
        WEAKSELF;
        _singleTableView.singleBlock = ^(NSString *goodsID){
            DetailsViewController *detailViewController = [[DetailsViewController alloc]init];
            detailViewController.goodsID = goodsID;
            detailViewController.hidesBottomBarWhenPushed = YES;
//            detailViewController.tabBarController.tabBar.hidden = YES;
            [weakSelf.navigationController pushViewController:detailViewController animated:YES];
            
        };
        
        
    }
    return _singleTableView;
}
/**
 * 品牌团购
 */
-(TimerTableView *)groupTableView{
    if (!_groupTableView) {
        _groupTableView = [[TimerTableView alloc]initWithFrame:CGRectMake(WIDTH, 280, WIDTH, 0) style:UITableViewStylePlain];
        _groupTableView.isSingle = NO;
        WEAKSELF;
        _groupTableView.groupBlock = ^(NSString *groupID){
            ClassListViewController *listViewVC = [[ClassListViewController alloc]init];
            listViewVC.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"appGgroupon/appGrounpGoodsList.do",@"URL",groupID,@"ID",@"GrouponId",@"keyword", nil];
            listViewVC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:listViewVC animated:YES];
        };
        
    }
    return _groupTableView;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:_mainScrollView]) {
        if (scrollView.contentOffset.y > 230) {
            //            scrollView.contentSize
            CGRect twoBtnRect = _twoButtonView.frame;
            twoBtnRect.origin.y = scrollView.contentOffset.y;
            _twoButtonView.frame = twoBtnRect;
        }else{
            _twoButtonView.frame = CGRectMake(0, 230, VIEW_WIDTH, 50);
        }
    }
}
-(UIBarButtonItem *)searchButoonItem{
    if (!_searchButoonItem) {
        UIButton *search = [UIButton buttonWithType:UIButtonTypeCustom];
        [search setImage:[UIImage imageNamed:@"限时特卖界面搜索按钮"] forState:UIControlStateNormal];
        search.frame = CGRectMake(0, 0, 30, 30);
        [search addTarget:self action:@selector(pushSearchViewController) forControlEvents:UIControlEventTouchUpInside];
        _searchButoonItem = [[UIBarButtonItem alloc]initWithCustomView:search];
        
    }
    return _searchButoonItem;
}
-(void)pushSearchViewController{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
@end
