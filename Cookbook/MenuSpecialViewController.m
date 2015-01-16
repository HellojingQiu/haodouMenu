//
//  MenuSpecialViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuSpecialViewController.h"
#import "MenuSpecialTableViewCell.h"
#import "MenuSpecial.h"
#import "MenuViewController.h"
#define kSpecial_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404992779&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Collect.getRecomList&limit=20&offset=0"
@interface MenuSpecialViewController ()

@end

@implementation MenuSpecialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"菜谱专辑";
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    _url=kSpecial_URL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate=self;
    // Do any additional setup after loading the view.
}

#pragma mark 数据代理
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"list"];
    NSMutableArray *dataArray=[NSMutableArray arrayWithArray:_dataArray];
    for (int i=0;i< tempArray.count; i++) {
        MenuSpecial *model=[MenuSpecial initWithDic:tempArray[i]];
        [dataArray addObject:model];
    }
    _dataArray=dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"MenuSpecialTableViewCell";
    MenuSpecialTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"MenuSpecialTableViewCell" owner:nil options:nil][0];
    }
    
    MenuSpecial *model=_dataArray[indexPath.row];
    cell.menuSpecial=model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 230;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuSpecial *model=_dataArray[indexPath.row];
    MenuViewController *mvc=[[MenuViewController alloc] init];
    mvc.title=model.title;
    mvc.cid=model.rid;
    [self.navigationController pushViewController:mvc animated:YES];
}

@end
