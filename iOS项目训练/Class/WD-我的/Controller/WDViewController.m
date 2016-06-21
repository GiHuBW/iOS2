//
//  WDViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "WDViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "CustomTableViewCell.h"

@interface WDViewController ()<UITableViewDelegate,UITableViewDataSource >

@property(nonatomic , strong)UITableView *WDLTableView;
@property(nonatomic , strong)UIView *headView;
@property(nonatomic , strong)NSArray *listContentArr;

@end

@implementation WDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAl_BackColor;
    [self.view addSubview:self.WDLTableView];
    WEAKSELF;
    [weakSelf.WDLTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}
#pragma mark - UITableViewDelegate方法
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120.0;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
////    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 35)];
////    headView.backgroundColor = GLOBAl_BackColor;
//    return self.headView;
//}
#pragma mark - UITableViewDataSource方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listContentArr.count  ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"WDCell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row != 5) {
        cell.rightLable.hidden = YES;
    }
    else{
        cell.rightImage.hidden = YES;
    }
    NSDictionary *dic = self.listContentArr[indexPath.row];
    cell.leftImage.image = [UIImage imageNamed:dic[@"image"]];
    cell.contentLable.text = dic[@"title"];
//    NSLog(@"%@",dic);
    return cell;
}

-(UITableView *)WDLTableView{
    if (!_WDLTableView) {
        _WDLTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0,0) style:UITableViewStyleGrouped];
        _WDLTableView.delegate = self;
        _WDLTableView.dataSource = self;
        _WDLTableView.tableHeaderView = self.headView;
        _WDLTableView.rowHeight = 44.0;
        _WDLTableView.backgroundColor = GLOBAl_BackColor;
        //关闭滚动效果
//        _WDLTableView.bounces = NO;
        
//        _WDLTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _WDLTableView;
}

-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(WIDTH);
        make.height.equalTo(125);
    }];
        
        UIImageView *backImage =[[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"我的背景"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [_headView addSubview:backImage];
        UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
        [login setTitle:@"登陆" forState:UIControlStateNormal];
        [login addTarget:self action:@selector(loginPressed) forControlEvents:UIControlEventTouchUpInside];
        [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIButton *regis = [UIButton buttonWithType:UIButtonTypeCustom];
        [regis setTitle:@"注册" forState:UIControlStateNormal];
        [regis addTarget:self action:@selector(registerPressed) forControlEvents:UIControlEventTouchUpInside];
        [regis setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_headView addSubview:login];
        [_headView addSubview:regis];
        [login mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_headView.center.y);
            make.left.mas_equalTo(_headView.mas_left).offset(107.5);
            make.height.mas_equalTo(34);
            make.width.mas_equalTo(100) ;
        }];
        [regis mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_headView.center.y);
            make.right.equalTo(-107.5);
            make.height.equalTo(34);
        }];
        
    }
    return _headView;
}
-(void)loginPressed{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];

}
-(void)registerPressed{
    RegisterViewController *regisVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regisVC animated:YES];
}
-(NSArray *)listContentArr{
    if (!_listContentArr) {
        _listContentArr = @[@{@"image":@"我的界面我的收藏图标",
                              @"title":@"我的收藏"
                              },
                            @{@"image":@"我的界面意见反馈图标",
                              @"title":@"意见反馈"},
                            @{@"image":@"我的界面关于我们图标",
                              @"title":@"关于我们"},
                            @{@"image":@"我的界面客服热线图标",
                              @"title":@"客服热线"},
                            @{@"image":@"我的界面我的优惠券图标",
                              @"title":@"我的优惠"},
                            @{@"image":@"我的界面邀请好友图标",
                              @"title":@"邀请好友，立刻赚钱"}
                            ];
        
    }
    return _listContentArr;
}

@end
