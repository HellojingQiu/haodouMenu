//
//  HotSearchController.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "HotSearchController.h"
#import "SearchTableViewCell.h"
#import "SearchCellArrows.h"
#import "SearchResultViewController.h"
#define kHotSearch_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1405305243&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Search.getHotSearch"
@interface HotSearchController ()

@end

@implementation HotSearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.title=@"热门搜索";
       self.delegate=self;
    }
    return self;
}

- (void)viewDidLoad
{
    _url=kHotSearch_URL;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark 数据加载成功 做数据处理
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"list"];
    NSMutableArray *dataArray=[NSMutableArray array];
    for (int i=0;i< tempArray.count; i++) {
        SearchCellArrows *baseModel=[[SearchCellArrows alloc]init];
        baseModel.title=tempArray[i];
        baseModel.arrowsType=ArrowsTypeMoreArrow;
        [dataArray addObject:baseModel];
    }
    _dataArray=dataArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"SearchCell";
    SearchTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    cell.baseCellModel=_dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark 单元格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseCellModel *cellModel=_dataArray[indexPath.row];
    
    SearchResultViewController *resultVc=[[SearchResultViewController alloc] init];
    resultVc.keyWorld=cellModel.title;
    [self.navigationController pushViewController:resultVc animated:YES];
}

@end
