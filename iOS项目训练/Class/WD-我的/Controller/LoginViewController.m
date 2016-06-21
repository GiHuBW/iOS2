//
//  LoginViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/20.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "LoginViewController.h"
#import "DLView.h"
#import "FastLogin.h"
@interface LoginViewController ()

@property(nonatomic , strong)DLView *LoginView;
@property(nonatomic , strong)FastLogin *fastLoginView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAl_BackColor;
    self.navigationItem.title = @"登陆";
    [self.view addSubview:self.LoginView];
    [self.view addSubview:self.fastLoginView];
    [self addLayOutIn];
    
}
-(void)addLayOutIn{
    WEAKSELF;
    [weakSelf.LoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(189);
    }];
    [weakSelf.fastLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.LoginView.mas_bottom).offset(35);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(80.5);
    }];
}
-(DLView *)LoginView{
    if (!_LoginView) {
        _LoginView = [[DLView alloc]init];
    }
    return _LoginView;
}
-(FastLogin *)fastLoginView{
    if (!_fastLoginView) {
        _fastLoginView = [[FastLogin alloc]init];
    }
    return _fastLoginView;
}
@end
