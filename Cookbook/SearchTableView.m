//
//  SearchTableView.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SearchTableView.h"
#import "SearchTableViewCell.h"
#import "SearchCellArrows.h"
#define kSearchBarText @"搜索菜谱，食材或功效"
@interface SearchTableView()
{
    UISearchBar *_searchBar;
}
@end

@implementation SearchTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        // Initialization code
        self.delegate=self;
        self.dataSource=self;
        _searchBar=[[UISearchBar alloc] init];
        _searchBar.frame=CGRectMake(0, 0, kScreenFrame.size.width, 44);
        _searchBar.delegate=self;
        _searchBar.placeholder=kSearchBarText;
        self.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.tableHeaderView=_searchBar;
    }
    return self;
}

#pragma mark tableview的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
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

#pragma mark 单元格点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseCellModel *model=_dataArray[indexPath.row];
    if ([model isKindOfClass:[SearchCellArrows class]]) {
        SearchCellArrows *arrow=(SearchCellArrows *)model;
        //单元格操作
        if (arrow.cellOperation) {
            arrow.cellOperation();
        }
        
    }
    
}
#pragma mark 搜索条代理
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    if (searchBar.text!=nil) {
        [self saveKeyWorld:searchBar.text];
        //点击搜索 设置代理方法执行
        [self.searchDelegate searchDataByKeyWorld:searchBar.text];
    }
    
}

#pragma mark 将搜索的关键字存入UserDefault
-(void)saveKeyWorld:(NSString *)keyWorld
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *searchArray=[NSMutableArray arrayWithArray:[userDefaults arrayForKey:kLatelySearchKey]];
    [searchArray addObject:keyWorld];
    
    [userDefaults setObject:searchArray forKey:kLatelySearchKey];
    [userDefaults synchronize];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{
    searchBar.text =@"";
    [_searchBar resignFirstResponder];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    _searchBar.showsCancelButton = YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    _searchBar.showsCancelButton = NO;
}

@end
