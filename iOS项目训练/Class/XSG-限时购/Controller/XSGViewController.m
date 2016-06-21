//
//  XSGViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "XSGViewController.h"
#import "FastLogin.h" 
#import "UMSocial.h"

@interface XSGViewController ()
@property (nonatomic , strong)UIButton *btn;
@end

@implementation XSGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAl_BackColor;
    [self.view addSubview:self.btn];
    
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor redColor];
        _btn.frame = CGRectMake(100, 100, 100, 100);
        [_btn addTarget:self action:@selector(btnTest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
-(void)btnTest{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}
@end
