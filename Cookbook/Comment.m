//
//  Comment.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+(id)initWithDic:(NSDictionary *)dic
{
    Comment *comment=[[self alloc] init];
    comment.avatar=dic[@"Avatar"];
    comment.content=dic[@"Content"];
    comment.createTime=dic[@"CreateTime"];
    comment.userId=[dic[@"UserId"] integerValue];
    comment.userName=dic[@"UserName"];
    return comment;
}

@end
