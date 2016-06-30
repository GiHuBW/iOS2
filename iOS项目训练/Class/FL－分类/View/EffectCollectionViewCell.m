//
//  EffectCollectionViewCell.m
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "EffectCollectionViewCell.h"

@interface EffectCollectionViewCell ()
/** 标题*/
@property(nonatomic, strong)UILabel *iconTitle;
/** 图标*/
@property(nonatomic , strong)UIImageView *iconImage;
@end

@implementation EffectCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.iconImage];
        [self addSubview:self.iconTitle];
    }
    return self;
}
-(void)setEffectModel:(EffectClassModel *)effectModel{
    _iconTitle.text = effectModel.GoodsTypeName;
    [_iconImage downloadImage:effectModel.ImgView place:[UIImage imageNamed:@"购物车界面静态购物车图标"]];
}
-(void)layoutSubviews{
    WEAKSELF;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 20, 30, 20));
    }];
    [_iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImage.mas_bottom);
        make.left.right.bottom.equalTo(weakSelf);
    }];
}
-(UILabel *)iconTitle{
    if (!_iconTitle) {
        _iconTitle = [[UILabel alloc]init];
        _iconTitle.textAlignment = NSTextAlignmentCenter;
        _iconTitle.font = [UIFont systemFontOfSize:12.0];
        _iconTitle.textColor = [UIColor blackColor];
    }
    return _iconTitle;
}
-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}
@end
