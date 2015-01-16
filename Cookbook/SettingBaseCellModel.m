//
//  SettingBaseCellModel.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SettingBaseCellModel.h"

@implementation SettingBaseCellModel

+(id)initWithTitle:(NSString *)title image:(NSString *)imageName
{
    SettingBaseCellModel *cellModel=[[self alloc] init];
    cellModel.cellTitle=title;
    cellModel.cellImage=imageName;
    return cellModel;
}

@end
