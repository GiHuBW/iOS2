//
//  DetailAllLabelView.h
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LabelHeightBlock)(CGFloat height);

@interface DetailAllLabelView : UIView

@property (strong, nonatomic)   NSArray *detailListModel;     /** 存储数据模型的数组 */
@property (copy, nonatomic) LabelHeightBlock labelHeightBlock;  /** 返回高度的block*/

@end
