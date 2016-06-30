//
//  HeadCollectionReusableView.m
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "HeadCollectionReusableView.h"

@interface HeadCollectionReusableView ()
@property(nonatomic ,strong)UILabel *titleLable;
@end

@implementation HeadCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLable];
    }
    return self;
}
-(void)setTitleLabelText:(NSString *)titleLabelText{
    _titleLable.text = titleLabelText;
}
-(void)layoutSubviews{
    WEAKSELF;
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 15, 0, 0));
    }];
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.font = [UIFont systemFontOfSize:13.0];
        _titleLable.textColor = [UIColor blackColor];
    }
    return _titleLable;
}
@end
