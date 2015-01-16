//
//  NoMJRefViewController.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SettingGroupSection.h"
#import "SettingTableViewCell.h"
#import "SettingBaseCellModel.h"
#import "SettingArrowsCellModel.h"
#define kBackImage  @"main_menu_icon_back.png"
#define kBackHomeImage @"main_ico_menu_home.png"
#define kTabbarSpace 20
#define kBtnWidth 50
@interface NoMJRefViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_cellGroup;
}
@property (strong,nonatomic) NSArray *cellGroup;

@end
