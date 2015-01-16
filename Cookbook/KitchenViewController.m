//
//  KitchenViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "KitchenViewController.h"
#import "KitchenModel.h"
#import "KitchenTableViewCell.h"
#import "WebViewController.h"
#define kKitchen_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404979448&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Wiki.getListByType&type=1&limit=20&offset=0"

@interface KitchenViewController ()

@end

@implementation KitchenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"厨房宝典";
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    _url=kKitchen_URL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate=self;
}

#pragma mark 代理方法
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"list"];
    NSMutableArray *dataArray=[NSMutableArray arrayWithArray:_dataArray];
    for (int i=0;i< tempArray.count; i++) {
        KitchenModel *model=[KitchenModel initWithDic:tempArray[i]];
        [dataArray addObject:model];
    }
    _dataArray=dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"KitchenCell";
    KitchenTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"KitchenTableViewCell" owner:nil options:nil][0];
    }
    
    KitchenModel *model=_dataArray[indexPath.row];
    cell.kitchenModel=model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 79;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KitchenModel *model=_dataArray[indexPath.row];
    WebViewController *webVc=[[WebViewController alloc] init];
    //url设定必须在title前 因为网络请求在设置title的时候做得请求
    webVc.webUrl=model.url;
    webVc.webTitle=model.title;
    [self.navigationController pushViewController:webVc animated:YES];
}

@end
