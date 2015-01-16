//
//  SettingViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingSwitchCellModel.h"
#import "SettingLabelCellModel.h"
@interface SettingViewController ()

@end

@implementation SettingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"设置";
    self.view.backgroundColor=kAllBgColor;
    
    SettingSwitchCellModel *netWorkSet=[SettingSwitchCellModel initWithTitle:@"2G/3G/4G 下展示图片" image:nil];
    SettingSwitchCellModel *shake=[SettingSwitchCellModel initWithTitle:@"开启摇一摇震动" image:nil];
    SettingLabelCellModel *clearCathc=[SettingLabelCellModel initWithTitle:@"清理缓存" image:nil];
    clearCathc.subTitle=@"6.25M";
    //通用
    SettingGroupSection *nomarlGroup=[[SettingGroupSection alloc] init];
    nomarlGroup.heard=@"通用";
    nomarlGroup.cells=@[netWorkSet,shake,clearCathc];
    
    SettingArrowsCellModel *about=[SettingArrowsCellModel initWithTitle:@"关于" image:nil];
    
    SettingLabelCellModel *updateV=[SettingLabelCellModel initWithTitle:@"更新版本" image:nil];
    updateV.subTitle=@"当前版本1.0.0";
    SettingArrowsCellModel *ideaBack=[SettingArrowsCellModel initWithTitle:@"意见反馈" image:nil];
    
    SettingBaseCellModel *setUsStar=[SettingBaseCellModel initWithTitle:@"给我们评分" image:nil];
    //支持
    SettingGroupSection *zhichi=[[SettingGroupSection alloc] init];
    zhichi.heard=@"支持";
    zhichi.cells=@[about,updateV,ideaBack,setUsStar];
    
    _cellGroup=@[nomarlGroup,zhichi];
}

@end
