//
//  MenuViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuDetialViewController.h"
#import "MenuViewModel.h"
#import "MenuViewCell.h"
#define kMenu_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404439649&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Collect.getRecipe&limit=40&gid=0&offset=0&cid="
@interface MenuViewController ()<MenuViewCellDelegate>

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate=self;
}

-(void)setCid:(NSInteger)cid
{
    _cid=cid;
    self.title=_mentTitle;
    _url=[NSString stringWithFormat:@"%@%d",kMenu_URL,cid];
    [self loadData:self.view];
}

#pragma mark 数据代理
-(void)dataLoadSuccess
{
    NSArray *dataList=_json[@"result"][@"list"];
    NSMutableArray *tempArray=[NSMutableArray array];
    NSMutableArray *subArray=[NSMutableArray array];
    int index=0;
    for (int i=0; i<dataList.count; i++) {
        MenuViewModel *model=[MenuViewModel initWithDic:dataList[i]];
        [subArray addObject:model];
        if (index==1) {
            [tempArray addObject:subArray];
            index=0;
            subArray=[NSMutableArray array];
        }else
        {
            index++;
        }
    }
    _dataArray=tempArray;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"MyMenuViewCell";
    MenuViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[MenuViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    cell.dataArray=_dataArray[indexPath.row];
    cell.delegate=self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

//#pragma mark 单元格点击事件
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    MenuDetialViewController *searchResultVc=[[MenuDetialViewController alloc] init];
//
//    [self.navigationController pushViewController:searchResultVc animated:YES];
//}

#pragma mark 单元格点击事件
-(void)menuViewCellClick:(MenuViewCell *)cell dataModel:(MenuViewModel *)model
{
    MenuDetialViewController *searchResultVc=[[MenuDetialViewController alloc] init];
    searchResultVc.menuTitle=model.title;
    searchResultVc.rid=model.rid;
    [self.navigationController pushViewController:searchResultVc animated:YES];
}

#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}



@end
