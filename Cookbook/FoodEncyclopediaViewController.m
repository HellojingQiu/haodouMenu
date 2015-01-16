//
//  FoodEncyclopediaViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "FoodEncyclopediaViewController.h"
#import "SearchCellArrows.h"
#import "SearchResultViewController.h"
#import "SearchTableViewCell.h"

#define kRandonCategory_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404959036&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Search.getCateListV3"
@interface FoodEncyclopediaViewController ()

@end

@implementation FoodEncyclopediaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"食材百科";
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    _url=kRandonCategory_URL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate=self;
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
