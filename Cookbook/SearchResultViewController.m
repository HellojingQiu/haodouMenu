//
//  SearchResultViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SearchResultViewController.h"
#import "HomeCagetoryListTableViewCell.h"
#import "HomeDetialResult.h"
#import "MenuDetialViewController.h"
#import "HomeDetialItem.h"
#define kLastUrl @"&tagid=&keyword=%@&limit=20&offset=0"
#define kRequestUrl @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1405306406&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Search.getListV3"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

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
    NSString *url=[NSString stringWithFormat:kLastUrl,_keyWorld];
    _url=[NSString stringWithFormat:@"%@%@",kRequestUrl,url];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=_keyWorld;
    self.delegate=self;
    // Do any additional setup after loading the view.
}

#pragma mark 数据加载成功
-(void)dataLoadSuccess
{
    NSDictionary *dic=_json;
    HomeDetialResult *result=[HomeDetialResult initWithDic:dic[@"result"]];
    NSMutableArray *tempArray=[NSMutableArray arrayWithArray:_dataArray];
    [tempArray addObjectsFromArray:result.items];
    _dataArray=tempArray;
    if (_dataArray.count==0) {
        UILabel *label=[[UILabel alloc] init];
        label.text=@"亲,暂时没有您想要搜索的数据,您可以搜索其他相关的数据.";
        label.numberOfLines=0;
        label.frame=CGRectMake(70, 100, 200, 100);
        label.textColor=kGetColor(0.5216, 0.6784, 0.3255, 1);
        [self.view addSubview:label];
    }
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
