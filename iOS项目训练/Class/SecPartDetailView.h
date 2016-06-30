//
//  SecPartDetailView.h
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecPartDetailModel.h"
typedef void(^returnHeight)(CGFloat height);

@interface SecPartDetailView : UIView

@property (strong, nonatomic)   UIButton *whiteButton;              /** 白色背景 */
@property (strong, nonatomic)   SecPartDetailModel *informationModel;          /** 存储商品描述的数组*/
@property (copy, nonatomic)     returnHeight heightBlock;       /**高度Black*/

@end
