//
//  AppRecommendViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AppRecommendViewController.h"
#import "AppTableViewCell.h"
#import "WebViewController.h"
#import "AppModel.h"
#define kApp_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404985391&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Ad.getAdV3"
@interface AppRecommendViewController ()
{
    AppModel *_heardModel;
}
@end

@implementation AppRecommendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"应用推荐";
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    _url=kApp_URL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate=self;
    
    [self loadData];
}
#pragma mark 数据加载
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"small_pic_ad"];
    _heardModel=[AppModel initWithDic:_json[@"result"][@"big_pic_ad"][0]];
    NSMutableArray *dataArray=[NSMutableArray arrayWithArray:_dataArray];
    for (int i=0;i< tempArray.count; i++) {
        AppModel *model=[AppModel initWithDic:tempArray[i]];
        [dataArray addObject:model];
    }
    _dataArray=dataArray;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"AppTableViewCell";
    AppTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"AppTableViewCell" owner:nil options:nil][0];
    }
    
    AppModel *model=_dataArray[indexPath.row];
    cell.appModel=model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppModel *model=_dataArray[indexPath.row];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:model.url]];
}
#pragma mark 顶部的View设置
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *image=[[UIImageView alloc] init];
    [image setImageWithURL:[NSURL URLWithString:_heardModel.image] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    image.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(heardClick:)];
    [image addGestureRecognizer:tap];
    return image;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 110;
}
#pragma mark 顶部点击事件监听
-(void)heardClick:(UITapGestureRecognizer *)tap
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_heardModel.url]];
}

#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}

@end
