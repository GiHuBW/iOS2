//
//  SearchViewController.m
//  iOS项目训练
//
//  Created by wb on 16/6/30.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SearchViewController.h"
#import "ClassListViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>

@property(nonatomic , strong)UISearchBar *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchBar;
}

-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [_searchBar becomeFirstResponder];
        _searchBar.placeholder = @"请输入要搜索的商品";
        _searchBar.showsCancelButton = YES;
        _searchBar.returnKeyType = UIReturnKeySearch;
        _searchBar.delegate = self;
    }
    return _searchBar;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.leftBarButtonItem = nil;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationItem.hidesBackButton = NO;
    self.tabBarController.tabBar.hidden= NO;
//    self.tabBarController.hidesBottomBarWhenPushed = NO;
//
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchBar resignFirstResponder];
}
#pragma mark - UISearchBarDelegate
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    ClassListViewController *listViewVC = [[ClassListViewController alloc]init];
    listViewVC.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"appSearch/searchList.do",@"URL",searchBar.text,@"ID",@"search",@"keyword", nil];
    [self.navigationController pushViewController:listViewVC animated:YES];
}
@end
