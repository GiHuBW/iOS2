//
//  Register.m
//  iOS项目训练
//
//  Created by wb on 16/6/20.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "Register.h"

@interface Register ()
@property(nonatomic , strong)UILabel *tipLable;
@property(nonatomic , strong)UIView *backView;
@property(nonatomic , strong)UITextField *phoneNum;
@property(nonatomic , strong)UITextField *password;
@property(nonatomic , strong)UILabel *lineLable;
@property(nonatomic , strong)UIButton *next;
@property(nonatomic , strong)UIButton *goLogin;
@end

@implementation Register

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tipLable];
        [self addSubview:self.backView];
        [self addSubview:self.phoneNum];
        [self addSubview:self.password];
        [self addSubview:self.lineLable];
        [self addSubview:self.next];
        [self addSubview:self.goLogin];
        [self addLayoutIn];

    }
    return self;
}
-(void)addLayoutIn{
    WEAKSELF;
    [weakSelf.tipLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.width.equalTo(300);
        make.height.equalTo(35);
    }];
    [weakSelf.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(35);
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
    [weakSelf.next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(35);
        
    }];
    [weakSelf.goLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.next.mas_bottom).offset(22);
        make.right.equalTo(weakSelf.next);
        make.height.equalTo(weakSelf.next);
        make.width.equalTo(100);
    }];

}
-(UILabel *)tipLable{
    if (!_tipLable) {
        _tipLable = [[UILabel alloc]init];
        _tipLable.text = @"请输入手机号码注册新用户";
        _tipLable.textColor = RGB(133, 133, 133);
        _tipLable.textAlignment = NSTextAlignmentLeft;
        _tipLable.font = [UIFont systemFontOfSize:17.0];
    }
    return _tipLable;
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
-(UIButton *)next{
    if (!_next) {
        _next = [UIButton buttonWithType:UIButtonTypeCustom];
        [_next setImage:[[UIImage imageNamed:@"注册界面下一步按钮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    return _next;
}
-(UIButton *)goLogin{
    if (!_goLogin) {
        _goLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goLogin setTitle:@"去登陆" forState:UIControlStateNormal];
        
        [_goLogin setTitleColor:RGB(0, 179, 239) forState:UIControlStateNormal];
    }
    return _goLogin;
}

@end
