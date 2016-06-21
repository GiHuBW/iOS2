//
//  CustomTableViewCell.m
//  iOS项目训练
//
//  Created by wb on 16/6/21.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "CustomTableViewCell.h"

static const CGFloat leftMargin = 15.0;
static const CGFloat imageWidth = 20.0;
static const CGFloat topMargin = 12.5;

@implementation CustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.leftImage];
        [self addSubview:self.contentLable];
        [self addSubview:self.lineLable];
        [self addSubview:self.rightLable];
        [self addSubview:self.rightImage];
//        [self hiddenRightLable];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)layoutSubviews{
    [super layoutSubviews];
    WEAKSELF;
    [weakSelf.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(leftMargin);
        make.top.equalTo(weakSelf.mas_top).offset(topMargin);
        make.width.height.equalTo(imageWidth);
    }];
    [weakSelf.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImage.mas_right).offset(leftMargin);
        make.top.equalTo(weakSelf.mas_top).offset(topMargin);
        make.height.equalTo(imageWidth);
        make.width.equalTo(200);
    }];
    [weakSelf.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.top.equalTo(weakSelf.mas_top).offset(44);
        make.width.equalTo(WIDTH - 50);
        make.height.equalTo(1);
    }];
    [weakSelf.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-leftMargin);
        make.top.equalTo(weakSelf.mas_top).offset(topMargin);
        make.height.equalTo(imageWidth);
        make.width.equalTo(200);
        
    }];
    [weakSelf.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-leftMargin);
        make.top.equalTo(weakSelf.mas_top).offset(topMargin);
         make.width.height.equalTo(imageWidth);
        
    }];
}

-(UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc]init];
//        _leftImage.image = [UIImage imageNamed:@"分类界面水乳咖喱图标"];
//        _leftImage.backgroundColor = [UIColor yellowColor];
    }
    return _leftImage;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.textColor = [UIColor blackColor];
        _contentLable.textAlignment  =NSTextAlignmentLeft;
//        _contentLable.text = @"我的收藏";
//        _contentLable.backgroundColor = [UIColor redColor];
    }
    return _contentLable;
}
-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable = [[UILabel alloc]init];
        _lineLable.backgroundColor = GLOBAl_BackColor;
    }
    return _lineLable;
}
-(UILabel *)rightLable{
    if (!_rightLable) {
        _rightLable = [[UILabel alloc]init];
        _rightLable.text = @"400-6010-545";
        _rightLable.textAlignment = NSTextAlignmentRight;
        _rightLable.textColor = RGB(142, 142, 142);
    }
    return _rightLable;
}
-(UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]init];
        _rightImage.image = [[UIImage imageNamed:@"下一步"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _rightImage;
}
//-(void)hiddenRightLable{
//    self.rightLable.hidden = YES;
//}
@end
