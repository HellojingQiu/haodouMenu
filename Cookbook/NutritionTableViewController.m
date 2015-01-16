//
//  NutritionTableViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "NutritionTableViewController.h"
#import "NutritionModel.h"
#import "NutritionTableViewCell.h"
#import "WebViewController.h"

#define kNutriTionBodyStr @"type=2&limit=20&offset=0&tagid=0"
#define KNutriTionTab_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404884406&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Wiki.getListByType&type=2&limit=20&offset=0"
@interface NutritionTableViewController ()

@end

@implementation NutritionTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"营养餐桌";
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    _url=KNutriTionTab_URL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate=self;
}

#pragma mark 数据代理
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"list"];
    NSMutableArray *dataArray=[NSMutableArray arrayWithArray:_dataArray];
    for (int i=0;i< tempArray.count; i++) {
        NutritionModel *model=[NutritionModel initWithDic:tempArray[i]];
        [dataArray addObject:model];
    }
    _dataArray=dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"NutritionTableViewCell";
    NutritionTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"NutritionTableViewCell" owner:nil options:nil][0];
    }
    
    NutritionModel *model=_dataArray[indexPath.row];
    cell.nutModel=model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NutritionModel *modeData=_dataArray[indexPath.row];
    WebViewController *webVc=[[WebViewController alloc] init];
    webVc.webUrl=modeData.url;
    webVc.webTitle=modeData.title;
    
    [self.navigationController pushViewController:webVc animated:YES];

}

@end
