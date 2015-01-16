//
//  LatelySearchController.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "LatelySearchController.h"
#import "SearchTableViewCell.h"
#import "SearchCellArrows.h"
#import "SearchResultViewController.h"
@interface LatelySearchController ()

@end

@implementation LatelySearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"最近搜索";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=kAllBgColor;
    
    NSArray *latelySearchArray=[[NSUserDefaults standardUserDefaults] arrayForKey:kLatelySearchKey];
    if (latelySearchArray.count==0) {
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nodata_other_search_zuijin.png"]];
        image.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        [self.view addSubview:image];

    }
    else
    {
        NSMutableArray *tempDataArray=[NSMutableArray array];
        for (int i=0; i<latelySearchArray.count; i++) {
            SearchCellArrows *searchCell=[[SearchCellArrows alloc] init];
            searchCell.title=latelySearchArray[i];
            searchCell.arrowsType=ArrowsTypeMoreArrow;
            [tempDataArray addObject:searchCell];
        }
        _dataArray=tempDataArray;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"searchCell";
    SearchTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    cell.baseCellModel=_dataArray[indexPath.row];
    return cell;
}

#pragma mark 单元格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchResultViewController *searchResultVc=[[SearchResultViewController alloc] init];
    BaseCellModel *cellModel=_dataArray[indexPath.row];
    searchResultVc.keyWorld=cellModel.title;
    [self.navigationController pushViewController:searchResultVc animated:YES];
}

#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}

@end
