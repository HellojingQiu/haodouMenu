//
//  MenuDetial.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuDetial.h"
#import "AdData.h"
#import "Comment.h"
#import "MenuIfo.h"
@implementation MenuDetial

+(id)initWithDic:(NSDictionary *)dic
{
    MenuDetial *menuDetial=[[self alloc] init];
    menuDetial.adData=[AdData initWithDic:dic[@"ad_data"]];
    menuDetial.adflag=[dic[@"ad_flag"] boolValue];
    
    NSArray *comment=dic[@"comment"];
    NSMutableArray *commentTemp=[NSMutableArray array];
    for (int i =0; i<comment.count; i++) {
        Comment *com=[Comment initWithDic:comment[i]];
        [commentTemp addObject:com];
    }
    menuDetial.commentArray=commentTemp;
    
    menuDetial.info=[MenuIfo initWithDic:dic[@"info"]];
    
    return menuDetial;
}

@end
