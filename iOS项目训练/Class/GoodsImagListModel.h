//
//  GoodsImagListModel.h
//  iOS项目训练
//
//  Created by wb on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsImagListModel : NSObject

/**图片地址*/
@property (copy, nonatomic) NSString *ImgView;

/**图片名称*/
@property (copy, nonatomic) NSString *ImgType;

/**图片尺寸*/
@property (copy, nonatomic) NSString *Resolution;

@end
