//
//  ClassListCollectionViewCell.m
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ClassListCollectionViewCell.h"

@interface ClassListCollectionViewCell ()

@property (strong, nonatomic)   UIImageView *countryImage;              /** 国旗 */
@property (strong, nonatomic)   UIImageView *goodsImage;              /** 商品图片 */
@property (strong, nonatomic)   UILabel *titleLabel;              /** 商品标题 */
@property (strong, nonatomic)   UILabel *priceLabel;              /** 价格label */

@end

@implementation ClassListCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.countryImage];
        [self addSubview:self.goodsImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    WEAKSELF;
    [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 80, 0));
    }];
    
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(11);
        make.left.equalTo(weakSelf.mas_left).offset(11);
        make.size.equalTo(CGSizeMake(22, 16));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.goodsImage.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(11);
        make.right.equalTo(weakSelf.mas_right).offset(-11);
        make.height.equalTo(40);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(11);
        make.right.equalTo(weakSelf.mas_right).offset(-11);
        make.height.equalTo(23);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(5);
    }];
}
-(void)setClassModel:(ClassListViewModel *)classModel{
    _classModel = classModel;
    [self.countryImage downloadImage:_classModel.CountryImg place:[UIImage imageNamed:@"购物车界面静态购物车图标"]];
    [self.goodsImage downloadImage:classModel.ImgView place:[UIImage imageNamed:@"购物车界面静态购物车图标"]];
    self.titleLabel.text = classModel.Abbreviation;
    self.priceLabel.attributedText = [NSMutableAttributedString makeStrikethroughAttributedString:classModel.Price :classModel.DomesticPrice rebateString:nil];
}
-(UIImageView *)countryImage{
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc]init];
    }
    return _countryImage;
}
-(UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc]init];
    }
    return _goodsImage;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _titleLabel;
}
-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _priceLabel;
}
@end
