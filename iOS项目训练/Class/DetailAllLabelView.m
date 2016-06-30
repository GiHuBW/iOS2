//
//  DetailAllLabelView.m
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "DetailAllLabelView.h"
#import "DetailLabelModel.h"

@implementation DetailAllLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setDetailListModel:(NSArray *)detailListModel{
    CGFloat height = [self makeAllLabel:detailListModel];
    if (_labelHeightBlock) {
        _labelHeightBlock(height);
    }
}

- (CGFloat)makeAllLabel:(NSArray *)dataArray{
    
    CGFloat heitht = 10;
    
    CGFloat valueLabelWidth = VIEW_WIDTH - 100;
    
    for (DetailLabelModel *model in dataArray) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, heitht, 60, 12)];
        titleLabel.text = model.Title;
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.textColor = [UIColor blackColor];
        [self addSubview:titleLabel];
        
        UILabel *valueLabel = [[UILabel alloc]init];
        CGFloat valueHeight = [NSString autoHeightWithString:model.Value Width:valueLabelWidth Font:[UIFont systemFontOfSize:12.0]];
        valueLabel.frame = CGRectMake(84, heitht, valueLabelWidth, valueHeight);
        valueLabel.text = model.Value;
        valueLabel.font = [UIFont systemFontOfSize:12.0];
        valueLabel.textAlignment = NSTextAlignmentLeft;
        valueLabel.textColor = [UIColor blackColor];
        [self addSubview:valueLabel];
        
        heitht = heitht + valueHeight + 15;
    }
    return heitht;
}

@end
