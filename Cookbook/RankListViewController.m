//
//  RankListViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "RankListViewController.h"
#import "RankModel.h"
#import "RankUserInfo.h"
#import "RankTableViewCell.h"
#import "MenuDetialViewController.h"
#define kRANKING_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404785091&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Suggest.top"

#define kHeardTag 700

@interface RankListViewController ()
{
    NSMutableArray *_flagHideArray;
    
    UITableView *_tableView;
}
@end

@implementation RankListViewController

-(void)loadView
{
    [super loadView];
    _url=kRANKING_URL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"排行榜";
    self.delegate=self;
    _flagHideArray=[NSMutableArray array];

    [self loadData];
}

#pragma mark 数据加载代理
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"list"];
    NSMutableArray *temp=[NSMutableArray array];
    for (int i=0; i<tempArray.count; i++) {
        RankModel *rm=[RankModel initWithDic:tempArray[i]];
        // 初始化都隐藏
        rm.hide=NO;
        [temp addObject:rm];
    }
    // 初始话隐藏所有的组
    for (int i=0; i<tempArray.count; i++) {
        [_flagHideArray addObject:[NSNumber numberWithInt:0]];
    }
    _dataArray=temp;
}

#pragma mark tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int hide=[_flagHideArray[section] intValue];
    if (hide==0) {
        return 0;
    }
    else
    {
        RankModel *rank=_dataArray[section];
        return rank.recipes.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"rankCell";
    RankTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"RankTableViewCell" owner:nil options:nil][0];
    }
    RankModel *user=_dataArray[indexPath.section];
    RankUserInfo *rank=user.recipes[indexPath.row];
    cell.index=indexPath.row+1;
    cell.userInfo=rank;

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RankHeaderView *header=[[RankHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    RankModel *rankModel=_dataArray[section];
    header.titleLabel.text=rankModel.title;
    //设置代理
    header.delegate=self;
    //设置状态
    if (rankModel.hide) {
        header.hide=YES;
    }else
    {
        header.hide=NO;
    }
    //设置tag
    header.tag=section+kHeardTag;
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 69;
}

#pragma mark 单元格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    RankModel *rankModel=_dataArray[indexPath.section];
    RankUserInfo *userInfo=rankModel.recipes[indexPath.row];
    MenuDetialViewController *menuDetial=[[MenuDetialViewController alloc] init];
    menuDetial.menuTitle=userInfo.title;
    menuDetial.rid=userInfo.recipeid;
    [self.navigationController pushViewController:menuDetial animated:YES];
}

#pragma mark section 点击事件
-(void)rankHeaderViewDidSelected:(RankHeaderView *)rankHeaderView
{
    //设置状态
    rankHeaderView.hide=YES;
    //获取当前section
    NSInteger section=rankHeaderView.tag-kHeardTag;
    //获取当前section数据
    RankModel *model=_dataArray[section];
    model.hide=!model.hide;
    if (model.hide) {
        _flagHideArray[section]=[NSNumber numberWithInt:1];
    }else
    {
        _flagHideArray[section]=[NSNumber numberWithInt:0];
    }
    //刷新指定的section
    [_outUserTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}

@end
