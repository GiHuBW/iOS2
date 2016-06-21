//
//  WDViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "WDViewController.h"
#import "DLView.h"
@interface WDViewController ()
@property(nonatomic , strong)DLView *dlView;
@end

@implementation WDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dlView = [[DLView alloc]initWithFrame:CGRectMake(0, 0, 375, 200)];
    [self.view addSubview:self.dlView];
//    [self addLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)addLayout{
    WEAKSELF;
    [weakSelf.dlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        
        make.height.equalTo(200);
    }];
}
-(DLView *)dlView{
    if (!_dlView) {
        _dlView = [[DLView alloc]init];
    }
    return _dlView;
}

@end
