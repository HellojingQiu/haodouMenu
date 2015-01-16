//
//  HomeCagetoryListViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "HomeCagetoryListViewController.h"
#import "HomeCagetoryListTableViewCell.h"
#import "HomeDetialResult.h"
#import "MenuDetialViewController.h"
#import "HomeDetialItem.h"
#define kHomeList_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404903331&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Search.getListV3"
#define kCurrectUrl @"&tagid=%@&keyword=&limit=20&offset=0"


@interface HomeCagetoryListViewController ()

@end

@implementation HomeCagetoryListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    self.title=_name;
    NSString *currectUrl=[NSString stringWithFormat:kCurrectUrl,_tagId];
    _url=[NSString stringWithFormat:@"%@%@",kHomeList_URL,currectUrl];
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate=self;
}

#pragma mark 数据加载成功
-(void)dataLoadSuccess
{
    NSDictionary *dic=_json;
    HomeDetialResult *result=[HomeDetialResult initWithDic:dic[@"result"]];
    
    NSMutableArray *tempArray=[NSMutableArray arrayWithArray:_dataArray];
    [tempArray addObjectsFromArray:result.items];
    _dataArray=tempArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"HomeCagetoryListTableViewCell";
    HomeCagetoryListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"HomeCagetoryListTableViewCell" owner:nil options:nil][0];
    }
    
    HomeDetialItem *result=_dataArray[indexPath.row];
    cell.homeDetialItem=result;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeDetialItem *result=_dataArray[indexPath.row];
    MenuDetialViewController *vc=[[MenuDetialViewController alloc] init];
    vc.menuTitle=result.title;
    vc.rid=result.recipeId;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
