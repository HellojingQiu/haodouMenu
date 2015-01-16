//
//  SettingTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingBaseCellModel;
@interface SettingTableViewCell : UITableViewCell

@property (copy,nonatomic) SettingBaseCellModel *baseCell;

@end
