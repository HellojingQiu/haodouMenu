//
//  AppModel.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

+(id)initWithDic:(NSDictionary *)dic
{
    AppModel *appModel=[[self alloc] init];
    appModel.desc=dic[@"Desc"];
    appModel.image=dic[@"Image"];
    appModel.title=dic[@"Title"];
    appModel.url=dic[@"Url"];
    
    return appModel;
}

@end
