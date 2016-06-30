//
//  ClassCollectionViewCell.m
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ClassCollectionViewCell.h"

@interface ClassCollectionViewCell ()
@property(nonatomic , strong)UIImageView *iconImageView;
@end
@implementation ClassCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.iconImageView];
    }
    return self;
}
-(void)setRecommedModel:(ClassCollectionModel *)recommedModel{
    [_iconImageView downloadImage:recommedModel.ImgView place:[UIImage imageNamed:@"购物车界面静态购物车图标"]];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    WEAKSELF;
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}
@end
