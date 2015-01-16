//
//  SearchViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableView.h"
#import "SearchCellArrows.h"
#import "SearchResultViewController.h"
@interface SearchViewController ()<SearchTableViewDelegate>
{
    SearchTableView *_searchTableView;
}
@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"搜索";
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    _searchTableView=[[SearchTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenFrame.size.width, kScreenFrame.size.height) style:UITableViewStylePlain];
    _searchTableView.scrollEnabled=NO;
    _searchTableView.count=kSearchContentName.count;
    _searchTableView.searchDelegate=self;
    [self.view addSubview:_searchTableView];
    
    NSMutableArray *tempArray=[[NSMutableArray alloc] init];
    for (int i=0; i<kSearchContentName.count; i++) {
        SearchCellArrows *searchCell=[[SearchCellArrows alloc] init];
        searchCell.title=kSearchContentName[i];
        searchCell.icon=kSearchContentIcon[i];
        searchCell.className=kPushControllerName[i];
        searchCell.arrowsType=ArrowsTypeRadius;
        __weak SearchViewController *weekSearch=self;
        searchCell.cellOperation=^
        {
            Class class=NSClassFromString(kPushControllerName[i]);
            UIViewController *controller=[[class alloc] init];
           [weekSearch.navigationController pushViewController:controller animated:YES];
        };
        
        [tempArray addObject:searchCell];
    }
    _searchTableView.dataArray=tempArray;
}

#pragma mark 搜索数据代理
-(void)searchDataByKeyWorld:(NSString *)keyWorld
{
    SearchResultViewController *searchResultVc=[[SearchResultViewController alloc] init];
    searchResultVc.keyWorld=keyWorld;
    [self.navigationController pushViewController:searchResultVc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
