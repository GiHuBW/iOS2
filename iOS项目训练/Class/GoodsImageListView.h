//
//  GoodsImageListView.h
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^imageHeightBlock)(CGFloat height);

@interface GoodsImageListView : UIView

@property (strong, nonatomic)   NSArray *imageArray;
@property (copy, nonatomic)     imageHeightBlock imageHeightBlock;    /** 返回高度的black*/

@end
