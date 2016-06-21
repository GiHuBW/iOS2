//
//  RegisterViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/20.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RegisterViewController.h"
#import "FastLogin.h"
#import "Register.h"
@interface RegisterViewController ()

@property(nonatomic , strong)Register *registerView;
@property(nonatomic , strong)FastLogin *fastLoginView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAl_BackColor;
    self.navigationItem.title = @"注册";
    [self.view addSubview:self.registerView];
    [self.view addSubview:self.fastLoginView];
    [self addLayouIn];
}
-(void)addLayouIn{
    WEAKSELF;
    [weakSelf.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(212.5);
    }];
    [weakSelf.fastLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.registerView.mas_bottom).offset(35);
        make.right.left.equalTo(weakSelf.view);
        make.height.equalTo(80.5);
    }];
}
-(Register *)registerView{
    if (!_registerView) {
        _registerView = [[Register alloc]init];
    }
    return _registerView;
}
-(FastLogin *)fastLoginView{
    if (!_fastLoginView) {
        _fastLoginView = [[FastLogin alloc]init];
    }
    return _fastLoginView;
}
@end
