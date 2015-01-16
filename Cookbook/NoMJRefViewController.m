//
//  NoMJRefViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "NoMJRefViewController.h"

@interface NoMJRefViewController ()
{
    UIView *_tabbar;
    UITableView *_tableView;
}
@end

@implementation NoMJRefViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    _tableView=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
    //子tabbar初始化
    [self initSubTabbar];
}

#pragma mark tableView数据代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _cellGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGroupSection *group=_cellGroup[section];
    return group.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"settingCell";
    SettingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ide];
    }
    SettingGroupSection *group=_cellGroup[indexPath.section];
    SettingBaseCellModel *model=group.cells[indexPath.row];
    cell.baseCell=model;
    return cell;
}

#pragma mark 单元格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingGroupSection *group=_cellGroup[indexPath.section];
    SettingBaseCellModel *model=group.cells[indexPath.row];
    
    if ([model isKindOfClass:[SettingArrowsCellModel class]]) {
        SettingArrowsCellModel *arrowsMode=(SettingArrowsCellModel *)model;
        if (arrowsMode.className) {
           UIViewController *vc= [[NSClassFromString(arrowsMode.className) alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            if (arrowsMode.operation) {
                arrowsMode.operation();
            }
        }
        
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SettingGroupSection *group=_cellGroup[section];
    return group.heard;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    SettingGroupSection *group=_cellGroup[section];
    return group.foot;
}

#pragma mark 非rootViewController的工具条
-(void)initSubTabbar
{
    _tabbar=[[UIView alloc] init];
    _tabbar.frame=CGRectMake(0, self.view.frame.size.height-2*kTabBarHeight-14+64, self.view.frame.size.width, kTabBarHeight);
    _tabbar.backgroundColor=[UIColor whiteColor];
    UIImageView *lineImageView=[[UIImageView alloc] init];
    lineImageView.image=kLineImage;
    lineImageView.frame=CGRectMake(0, 0, kScreenWidth, 1);
    [_tabbar addSubview:lineImageView];
    
    //返回上级controller
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:kBackImage] forState:UIControlStateNormal];
    backBtn.frame=CGRectMake(kTabbarSpace, 0, kBtnWidth, kTabBarHeight);
    backBtn.tag=10;
    [backBtn addTarget:self action:@selector(btnBackClick:) forControlEvents:UIControlEventTouchDown];
    [_tabbar addSubview:backBtn];
    //返回主controller
    UIButton *backHome= [UIButton buttonWithType:UIButtonTypeCustom];
    [backHome setImage:[UIImage imageNamed:kBackHomeImage] forState:UIControlStateNormal];
    backHome.frame=CGRectMake(self.view.frame.size.width-kBtnWidth-kTabbarSpace, 0, kBtnWidth, kTabBarHeight);
    backHome.tag=11;
    [backHome addTarget:self action:@selector(btnBackClick:) forControlEvents:UIControlEventTouchDown];
    [_tabbar addSubview:backHome];
    [self.view addSubview:_tabbar];
}

-(void)btnBackClick:(UIButton *)btn
{
    if (btn.tag==10) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else if (btn.tag==11)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
