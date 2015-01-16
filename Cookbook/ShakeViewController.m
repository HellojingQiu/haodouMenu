//
//  ShakeViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ShakeViewController.h"
#import "SoundTool.h"
#import "ShakeModel.h"
#import "ShakeTableViewCell.h"
#import "MenuDetialViewController.h"
#define kShark_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1405328571&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Info.shake"
@interface ShakeViewController ()
{
    UIImageView *_bgImage;
}
@end

@implementation ShakeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _url=kShark_URL;
    self.title=@"摇一摇";
    self.view.backgroundColor=kAllBgColor;
    self.delegate=self;
    _bgImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shake.png"]];
    _bgImage.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-80);
    [self.view addSubview:_bgImage];
    
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    
    [self becomeFirstResponder];
}
#pragma mark 加载数据
-(void)loadData
{
    [_bgImage removeFromSuperview];
    [super loadData];
//    [UIUtils testData:_url];
}

#pragma mark 代理数据加载成功的方法
-(void)dataLoadSuccess
{
    NSArray *tempArray=_json[@"result"][@"list"];
    NSMutableArray *dataArray=[NSMutableArray array];
    for (int i=0; i<tempArray.count; i++) {
        ShakeModel *shakeModel=[ShakeModel initWithDic:tempArray[i]];
        [dataArray addObject:shakeModel];
    }
    
    _dataArray=dataArray;
}

#pragma mark tableView数据加载
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"ShakeCell";
    ShakeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"ShakeTableViewCell" owner:nil options:nil][0];
    }
    cell.shakeModel=_dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShakeModel *model=_dataArray[indexPath.row];
    MenuDetialViewController *mdVc=[[MenuDetialViewController alloc] init];
    mdVc.menuTitle=model.title;
    mdVc.rid=model.sid;
    [self.navigationController pushViewController:mdVc animated:YES];
}

#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}


#pragma mark 摇动代理
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //检测到摇动
    [[SoundTool shareSoundTool] playSound:@"shake_match"];
}
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //摇动取消
}
- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //摇动结束
    if (event.subtype == UIEventSubtypeMotionShake) {
        [self loadData];
    }
}

@end
