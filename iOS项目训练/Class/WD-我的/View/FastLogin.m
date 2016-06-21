//
//  FastLogin.m
//  iOS项目训练
//
//  Created by wb on 16/6/20.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "FastLogin.h"

@interface FastLogin ()
@property(nonatomic , strong)UILabel *lineLable;
@property(nonatomic , strong)UILabel *oneKeyLable;
@property(nonatomic , strong)UIButton *qqBtn;
@property(nonatomic , strong)UIButton *weChatBtn;
@property(nonatomic , strong)UIButton *sinaBtn;
@end

@implementation FastLogin

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLable];
        [self addSubview:self.oneKeyLable];
        [self addSubview:self.qqBtn];
        [self addSubview:self.weChatBtn];
        [self addSubview:self.sinaBtn];
        [self addLayoutIn];
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)addLayoutIn{
    WEAKSELF;
    [weakSelf.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(8);
        make.left.equalTo(weakSelf).offset(16);
        make.right.equalTo(weakSelf).offset(-16);
        make.height.equalTo(1);
    }];
    [weakSelf.oneKeyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.lineLable);
        make.centerX.equalTo(weakSelf.lineLable);
        make.width.equalTo(120);
        make.height.equalTo(40);
    }];
    [weakSelf.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(60);
        make.width.height.equalTo(45);
        make.top.equalTo(weakSelf.oneKeyLable.mas_bottom).offset(19);
    }];
    [weakSelf.weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.qqBtn.mas_right).offset(60);
        make.width.height.equalTo(45);
        make.top.equalTo(weakSelf.oneKeyLable.mas_bottom).offset(19);
    }];
    [weakSelf.sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.weChatBtn.mas_right).offset(61);
        make.width.height.equalTo(45);
        make.top.equalTo(weakSelf.oneKeyLable.mas_bottom).offset(19);
    }];


}

-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable = [[UILabel alloc]init];
        _lineLable.backgroundColor = RGB(200, 200, 200);
    }
    return _lineLable;
}
-(UILabel *)oneKeyLable{
    if (!_oneKeyLable) {
        _oneKeyLable = [[UILabel alloc]init];
        _oneKeyLable.text = @"一键登录";
        _oneKeyLable.textColor = RGB(200, 200, 200);
        _oneKeyLable.textAlignment = NSTextAlignmentCenter;
        _oneKeyLable.backgroundColor = GLOBAl_BackColor;
    }
    return _oneKeyLable;
}
-(UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqBtn setImage:[[UIImage imageNamed:@"登录界面qq登陆"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_qqBtn addTarget:self action:@selector(testMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqBtn;
}
-(UIButton *)weChatBtn{
    if (!_weChatBtn) {
        _weChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weChatBtn setImage:[[UIImage imageNamed:@"登录界面微信登录"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    }
    return _weChatBtn;
}
-(UIButton *)sinaBtn{
    if (!_sinaBtn) {
        _sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sinaBtn setImage:[[UIImage imageNamed:@"登陆界面微博登录"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    return _sinaBtn;
}

-(void)testMethod{
    NSLog(@"I LLOVE YOU");
}
@end
