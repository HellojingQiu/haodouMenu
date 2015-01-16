//
//  Steps.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Steps.h"

@implementation Steps

+(id)initWithDic:(NSDictionary *)dic
{
    Steps *step=[[self alloc] init];
    step.intro=dic[@"Intro"];
    step.stepPhoto=dic[@"StepPhoto"];
    return step;
}

@end
