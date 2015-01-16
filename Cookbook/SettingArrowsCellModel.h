//
//  SettingArrowsCellModel.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SettingBaseCellModel.h"

@interface SettingArrowsCellModel : SettingBaseCellModel

@property (copy,nonatomic) NSString *subTitle;
@property (copy,nonatomic) void (^operation)();
@property (copy,nonatomic) NSString *className;

@end
