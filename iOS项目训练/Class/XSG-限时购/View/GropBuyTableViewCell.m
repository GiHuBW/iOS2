//
//  GropBuyTableViewCell.m
//  iOS项目训练
//
//  Created by wb on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "GropBuyTableViewCell.h"

@interface GropBuyTableViewCell ()
/**
 *显示品牌团购的图片
 */
@property(nonatomic , strong)UIImageView *groupImage;

@end
@implementation GropBuyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.groupImage];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    [_groupImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}

- (void)setGroupBuyModel:(GroupBuyModel *)groupBuyModel{
    
    [_groupImage downloadImage:groupBuyModel.ImgView place:[UIImage imageNamed:@"桌面"]];
//    [_groupImage sd_setImageWithURL:[NSURL URLWithString:groupBuyModel.ImgView] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//
}

- (UIImageView *)groupImage{
    if (!_groupImage) {
        _groupImage = [[UIImageView alloc]init];
    }
    return _groupImage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
