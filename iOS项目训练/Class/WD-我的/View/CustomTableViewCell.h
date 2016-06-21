//
//  CustomTableViewCell.h
//  iOS项目训练
//
//  Created by wb on 16/6/21.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property(nonatomic , strong)UIImageView *leftImage;
@property(nonatomic , strong)UILabel *contentLable;
@property(nonatomic , strong)UILabel *lineLable;
@property(nonatomic , strong)UILabel *rightLable;
@property(nonatomic , strong)UIImageView *rightImage;

@end
