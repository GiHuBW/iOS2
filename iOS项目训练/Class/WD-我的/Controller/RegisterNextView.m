//
//  RegisterNextView.m
//  iOS项目训练
//
//  Created by wb on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RegisterNextView.h"

@interface RegisterNextView ()<UITextFieldDelegate>
@property(nonatomic , strong)UILabel *stateLable;
@property(nonatomic , strong)UILabel *lineLable;
@property(nonatomic , strong)UIView *backView;
@end

@implementation RegisterNextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.stateLable];
        [self addSubview:self.lineLable];
        [self addSubview:self.backView];
        [self addSubview:self.verificationText];
        [self addSubview:self.registerButton];
        [self addSubview:self.resendButton];
        [self addSubview:self.timeLable];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    WEAKSELF;
    [_stateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(35);
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.stateLable.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.height.equalTo(43);
    }];
    [_verificationText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.bottom.equalTo(weakSelf.backView.mas_bottom);
        make.right.equalTo(weakSelf.mas_right).offset(-105);
    }];
    [_lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backView.mas_top).offset(5);
        make.bottom.equalTo(weakSelf.backView.mas_bottom).offset(-5);
        make.width.equalTo(1);
        make.left.equalTo(weakSelf.verificationText.mas_right);
    }];
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLable.mas_right);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.backView.mas_bottom);
        make.top.equalTo(weakSelf.backView.mas_top);
    }];
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(35);
        make.top.equalTo(weakSelf.backView.mas_bottom).offset(16);
    }];
    [_resendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.registerButton.mas_bottom).offset(22);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.equalTo(CGSizeMake(150, 18));
    }];
    
}

-(UILabel *)stateLable{
    if (!_stateLable) {
        _stateLable = [[UILabel alloc]init];
        _stateLable.text = @"验证码已发送到 ＋86";
        _stateLable.textColor = [UIColor grayColor];
        NSDictionary *dic = @{
                              NSFontAttributeName : [UIFont systemFontOfSize:14.0],
                              NSForegroundColorAttributeName : RGB(0, 194, 240)
                              };
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:[_stateLable.text substringWithRange:NSMakeRange(8,3)] attributes:dic];
        _stateLable.attributedText = attString;
        
    }
    return _stateLable;
}
-(UIView *)backView{
    if (!_backView) {
        _backView  = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable = [[UILabel alloc]init];
        _lineLable.backgroundColor = RGB(234, 234, 234);
    }
    return _lineLable;
}
-(UITextField *)verificationText{
    if (!_verificationText) {
        _verificationText = [[UITextField alloc]init];
        _verificationText.placeholder = @"请输入验证码";
        _verificationText.delegate = self;
    }
    return _verificationText;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
    }
    return _timeLable;
}
-(UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.backgroundColor = RGB(234, 234, 234);
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:RGB(145, 145, 145) forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _registerButton.layer.masksToBounds = YES;
        _registerButton.layer.cornerRadius = 5.0;
    }
    return _registerButton;
}
-(UIButton *)resendButton{
    if (!_resendButton) {
        _resendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resendButton setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        [_resendButton setTitleColor:RGB(203, 203, 203) forState:UIControlStateNormal];
        [_resendButton setTitleColor:RGB(68, 184, 245) forState:UIControlStateSelected];
    }
    return _resendButton;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.text.length == 4) {
        _registerButton.selected = YES;
        _registerButton.backgroundColor = RGB(67, 182, 245);
    }
    else{
        _registerButton.selected = NO;
        _registerButton.backgroundColor = RGB(243, 243, 243);
    }
    return YES;
}
@end
