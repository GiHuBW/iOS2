//
//  DetailHeadImage.m
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "DetailHeadImage.h"

@interface DetailHeadImage ()<SDCycleScrollViewDelegate>
@property(nonatomic , strong)UILabel *haveBuyLable;
@end
@implementation DetailHeadImage
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headImage];
        [self addSubview:self.haveBuyLable];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    WEAKSELF;
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [_haveBuyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(11);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(30);
        make.size.equalTo(CGSizeMake(90, 22));
    }];
}
-(void)setHaVeBuyNum:(NSString *)haVeBuyNum{
    self.haveBuyLable.text = [NSString stringWithFormat:@"%@",haVeBuyNum];
}
-(UILabel *)haveBuyLable{
    if (!_haveBuyLable) {
        _haveBuyLable = [[UILabel alloc]init];
        _haveBuyLable.layer.masksToBounds = YES;
        _haveBuyLable.layer.cornerRadius = 11.0;
        _haveBuyLable.backgroundColor = RGB(238, 74, 47);
        _haveBuyLable.font = [UIFont systemFontOfSize:11.0];
        _haveBuyLable.textColor = [UIColor whiteColor];
        _haveBuyLable.textAlignment = NSTextAlignmentCenter;
    }
    return _haveBuyLable;
}
-(SDCycleScrollView *)headImage{
    if (!_headImage) {
        _headImage = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 230) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _headImage.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _headImage.currentPageDotColor = [UIColor whiteColor];
    }
    return _headImage;
}
@end
