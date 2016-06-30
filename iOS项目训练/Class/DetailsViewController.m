//
//  DetailsViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailHeadImage.h"
#import "SecPartDetailView.h"
#import "DetailAllLabelView.h"
#import "GoodsImageListView.h"
#import "ShoppingCar.h"
#import "SecPartDetailModel.h"
#import "DetailLabelModel.h"
#import "GoodsImagListModel.h"
@interface DetailsViewController ()<UIScrollViewDelegate>
//底部滚动视图
@property(nonatomic ,strong) UIScrollView *maicScroll;
//添加控件的基础视图
@property(nonatomic ,strong) UIView *mainView;
//头部轮播视图
@property(nonatomic ,strong) DetailHeadImage *headImageView;
//描述视图
@property(nonatomic ,strong) SecPartDetailView *detailView;
//所有Lable视图
@property(nonatomic , strong) DetailAllLabelView *allLableView;
//所有图片
@property(nonatomic ,strong) GoodsImageListView *allImagesView;
//底部购物车视图
@property(nonatomic ,strong) ShoppingCar *shoppingCarView;
//视图总高度
@property(nonatomic ,assign) CGFloat mainViewHeight;


@end

@implementation DetailsViewController
-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    //给mainViewHeight一个初始高度（等于头部轮播图的高度）
    self.mainViewHeight = 230;
    //自适应Scroll内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.maicScroll];
    [self.maicScroll addSubview:self.mainView];
    [self.mainView addSubview:self.headImageView];
    [self.mainView addSubview:self.detailView];
    [self.mainView addSubview:self.allLableView];
    [self.mainView addSubview:self.allImagesView];
    [self.view addSubview:self.shoppingCarView];
    [self addLayoutInView];
    [self reloadData];
//    self.tabBarController.tabBar = self.shoppingCarView;
    
}
//给视图添加约束
-(void)addLayoutInView{
    WEAKSELF;
    [_maicScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
    
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mainView.mas_top).offset(260);
        make.left.equalTo(weakSelf.mainView.mas_left);
        make.right.equalTo(weakSelf.mainView.mas_right);
        make.height.equalTo(1);
    }];
    [_allLableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.detailView.mas_bottom);
        make.left.equalTo(weakSelf.mainView.mas_left);
        make.right.equalTo(weakSelf.mainView.mas_right);
        make.height.equalTo(1);
    }];
    [_allImagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.allLableView.mas_bottom);
        make.left.equalTo(weakSelf.mainView.mas_left);
        make.right.equalTo(weakSelf.mainView.mas_right);
        make.height.equalTo(1);
    }];
    [_shoppingCarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(45);
    }];
}
//请求数据
-(void)reloadData{
    WEAKSELF;
    //商品图片列表
    [self getDataFromSever:@"appGoods/findGoodsImgList.do" parameter:@{@"GoodsId":_goodsID} isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSArray *imageArray = [GoodsImagListModel mj_objectArrayWithKeyValuesArray:project];
        NSMutableArray *headImage = [NSMutableArray arrayWithCapacity:imageArray.count];
        for (GoodsImagListModel *image in imageArray) {
            if ([image.ImgType isEqualToString:@"1"]) {
                [headImage addObject:image.ImgView];
            }
        }
        weakSelf.headImageView.headImage.imageURLStringsGroup = [NSArray arrayWithArray:headImage];
        weakSelf.allImagesView.imageArray = imageArray;
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    //商品信息
    [self getDataFromSever:@"appGoods/findGoodsDetail.do" parameter:@{@"GoodsId":_goodsID} isSuccess:^(NSURLSessionDataTask *task, id project) {
        weakSelf.detailView.informationModel = [SecPartDetailModel mj_objectWithKeyValues:project];
        weakSelf.headImageView.haVeBuyNum = weakSelf.detailView.informationModel.BuyCount;
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    //商品描述
    [self getDataFromSever:@"appGoods/findGoodsDetailList.do" parameter:@{@"GoodsId":_goodsID} isSuccess:^(NSURLSessionDataTask *task, id project) {
        weakSelf.allLableView.detailListModel = [DetailLabelModel    mj_objectArrayWithKeyValuesArray:project];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
#pragma mark - UIScrollViewDelegate
//实现scrollView上部分视图的滚动与整体分离
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y < 170) {
        //实现上面headImage滚动比其他内容慢一点的操作
        CGRect rect = _headImageView.frame;
        rect.origin.y = scrollView.contentOffset.y/2;
        _headImageView.frame = rect;
    }
}

-(UIScrollView *)maicScroll{
    if (!_maicScroll) {
        _maicScroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _maicScroll.delegate = self;
        _maicScroll.userInteractionEnabled = YES;
        _maicScroll.translatesAutoresizingMaskIntoConstraints = NO;
        _maicScroll.contentSize = CGSizeMake(0, 230);
    }
    return _maicScroll;
}
-(UIView *)mainView{
    if (!_mainView) {
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    }
    return _mainView;
}
-(DetailHeadImage *)headImageView{
    if (!_headImageView) {
        _headImageView = [[DetailHeadImage alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 230)];
    }
    return _headImageView;
}
-(SecPartDetailView *)detailView{
    if (!_detailView) {
        _detailView = [[SecPartDetailView alloc]init];
        _detailView.backgroundColor = [UIColor whiteColor];
        WEAKSELF;
        _detailView.heightBlock = ^(CGFloat height){
            [weakSelf.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(height);
            }];
            weakSelf.mainViewHeight += height;
        };
    }
    return _detailView;
}
-(DetailAllLabelView *)allLableView{
    if (!_allLableView) {
        _allLableView = [[DetailAllLabelView alloc]init];
        WEAKSELF;
        _allLableView.labelHeightBlock = ^(CGFloat height){
            [weakSelf.allLableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(height);
            }];
            weakSelf.mainViewHeight += height;
        };
    }
    return _allLableView;
}
-(GoodsImageListView *)allImagesView{
    if (!_allImagesView) {
        _allImagesView = [[GoodsImageListView alloc]init];
        WEAKSELF;
        _allImagesView.imageHeightBlock = ^(CGFloat height){
            [weakSelf.allImagesView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(height);
            }];
            weakSelf.mainViewHeight += height;
        };
    }
    return _allImagesView;
}
-(ShoppingCar *)shoppingCarView{
    if (!_shoppingCarView) {
        _shoppingCarView = [[ShoppingCar alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT-49, VIEW_WIDTH, 49)];
    }
    return _shoppingCarView;
}
-(void)setMainViewHeight:(CGFloat)mainViewHeight{
    _mainViewHeight = mainViewHeight;
    _maicScroll.contentSize = CGSizeMake(0, _mainViewHeight);
}
@end
