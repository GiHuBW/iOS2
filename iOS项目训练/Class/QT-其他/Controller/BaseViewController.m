//
//  BaseViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "BaseViewController.h"

static NSString *const kBaseURLString = @"http://123.57.141.249:8080/beautalk/";


@implementation AFNetworkingClient

+ (instancetype)sharedClient{
    static AFNetworkingClient *shareClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!shareClient) {
            shareClient = [[self alloc]initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
            
            shareClient.responseSerializer = [AFJSONResponseSerializer serializer];
            
            shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        }
    });
    
    return shareClient;
}



@end


@interface BaseViewController ()

@end

@implementation BaseViewController



//- (void)loadView{
//    self.view = [[UIView alloc]init];
//    self.view.backgroundColor = [UIColor cyanColor];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    //        self.view.backgroundColor = [UIColor cyanColor];
}

- (void)postDataFromSever:(NSString *)URL
                parameter:(NSDictionary *)parameter
                isSuccess:(successBlock)success
                  isError:(errorBlock)isError{
    __weak typeof(self)weakSelf = self;
    [SVProgressHUD show];
    [[AFNetworkingClient sharedClient] POST:URL
                                 parameters:parameter
                                   progress:nil
                                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                        [SVProgressHUD dismiss];
                                        if (success) {
                                            success(task,responseObject);
                                        }
                                        
                                        
                                    }
                                    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                        [SVProgressHUD dismiss];
                                        [weakSelf showTostView:@"请检查网络连接状态"];
                                        if (isError) {
                                            isError(task,error);
                                        }
                                        
                                    }];
    
}


- (void)getDataFromSever:(NSString *)URL
               parameter:(NSDictionary *)parameter
               isSuccess:(successBlock)success
                 isError:(errorBlock)errorblock{
    __weak typeof(self)weakSelf = self;
    [SVProgressHUD show];
    [[AFNetworkingClient sharedClient]GET:URL
                               parameters:parameter
                                 progress:nil
                                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                      [SVProgressHUD dismiss];
                                      if (success) {
                                          success(task,responseObject);
                                      }
                                      
                                  }
                                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                      [SVProgressHUD dismiss];
                                      [weakSelf showTostView:@"请检查网络连接状态"];
                                      if (errorblock) {
                                          errorblock(task,error);
                                      }
                                      
                                  }];
    
}

- (void)addBackButtonOnNav{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(returnViewController) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)returnViewController{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)showTostView:(NSString *)tostString{
    [self.view makeToast:tostString duration:1.3 position:@"center"];
}

- (void)dealloc{
    [[AFNetworkingClient sharedClient].operationQueue cancelAllOperations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
