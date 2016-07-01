//
//  ClassListFourButtonView.h
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^parameterDictionaryBlock)(NSDictionary *dic);

@interface ClassListFourButtonView : UIView

@property(nonatomic , strong) UIButton *hotButton;
@property(nonatomic , strong) UIButton *priceButton;
@property(nonatomic , strong) UIButton *goodButton;
@property(nonatomic , strong) UIButton *newsButton;
@property(nonatomic , copy) parameterDictionaryBlock parameterDictionary;
@end
