//
//  TimerTableView.m
//  iOS项目训练
//
//  Created by wb on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TimerTableView.h"
#import "GropBuyTableViewCell.h"
#import "SingleBuyTableViewCell.h"

@implementation TimerTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据isSingle的值来设定对应cell的个数
    if (_isSingle) {
        return _singleListArray.count;
    }else{
        return _groupBuyListArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //根据isSingle的值来设定对应cell的高度
    if (_isSingle) {
        return 170;
    }else
        return 175;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    //根据isSingle的值来判断显示哪一个cell
    if (_isSingle) {
        SingleBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[SingleBuyTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.singleList = self.singleListArray[indexPath.row];
        return cell;
        
    }else{
        GropBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[GropBuyTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.groupBuyModel = self.groupBuyListArray[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSingle) {
        if (_singleBlock) {
            NSString *goodsID = [self.singleListArray[indexPath.row] GoodsId];
            _singleBlock(goodsID);
        }
    }else{
        if (_groupBlock) {
            NSString *ActivityId = [self.groupBuyListArray[indexPath.row] ActivityId];
            _groupBlock(ActivityId);
        }
    }
}


@end
