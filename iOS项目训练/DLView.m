//
//  DLView.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "DLView.h"

@interface DLView ()
@property(nonatomic , strong)UIView *backView;
@property(nonatomic , strong)UITextField *phoneNum;
@property(nonatomic , strong)UITextField *password;
@property(nonatomic , strong)UILabel *lineLable;
@property(nonatomic , strong)UIButton *login;
@property(nonatomic , strong)UIButton *freeRegis;
@end

@implementation DLView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(245, 245, 245);
        [self addSubview:self.backView];
        [self addSubview:self.phoneNum];
        [self addSubview:self.password];
        [self addSubview:self.lineLable];
        [self addSubview:self.login];
        [self addSubview:self.freeRegis];
        [self addLayOutIn];
        
    }
    return self;
}
-(void)addLayOutIn{
    WEAKSELF;
    [weakSelf.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(15);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(88);
    }];
    [weakSelf.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_top);
        make.left.equalTo(weakSelf.backView.mas_left).offset(15);
        make.right.equalTo(weakSelf.backView.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    [weakSelf.password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.phoneNum.mas_bottom);
        make.left.equalTo(weakSelf.backView.mas_left).offset(15);
        make.right.equalTo(weakSelf.backView.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    [weakSelf.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_top).offset(44);
        make.left.equalTo(weakSelf.backView.mas_left).offset(15);
        make.right.equalTo(weakSelf.backView.mas_right).offset(-15);
        make.height.equalTo(1);
    }];
    [weakSelf.login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(35);

    }];
    [weakSelf.freeRegis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.login.mas_bottom).offset(17);
        make.right.equalTo(weakSelf.login);
        make.height.equalTo(weakSelf.login);
        make.width.equalTo(100);
    }];
}

-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
-(UITextField *)phoneNum{
    if (!_phoneNum) {
        _phoneNum = [[UITextField alloc]init];
        _phoneNum.placeholder = @"请输入手机号码";
    }
    return _phoneNum;
}
-(UITextField *)password{
    if (!_password) {
        _password = [[UITextField alloc]init];
        _password.placeholder = @"请输入密码";
    }
    return _password;
}
-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable = [[UILabel alloc]init];
        _lineLable.backgroundColor = RGB(234, 234, 234);
    }
    return _lineLable;
}
-(UIButton *)login{
    if (!_login) {
        _login = [UIButton buttonWithType:UIButtonTypeCustom];
        _login.backgroundColor = RGB(0, 183, 239);
        [_login setTitle:@"登陆" forState:UIControlStateNormal];
        _login.titleLabel.textColor = [UIColor whiteColor];
        _login.titleLabel.textAlignment = NSTextAlignmentCenter;
        _login.layer.masksToBounds = YES;
        _login.layer.cornerRadius = 5.f;
    }
    return _login;
}
-(UIButton *)freeRegis{
    if (!_freeRegis) {
        _freeRegis = [UIButton buttonWithType:UIButtonTypeCustom];
        [_freeRegis setTitle:@"免费注册" forState:UIControlStateNormal];
        
        [_freeRegis setTitleColor:RGB(65, 179, 241) forState:UIControlStateNormal];
    }
    return _freeRegis;
}
@end
