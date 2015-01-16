//
//  RankModel.h
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankModel : NSObject

@property (assign,nonatomic) NSInteger tagId;
@property (copy,nonatomic) NSString *title;
@property (strong,nonatomic) NSArray *recipes;
@property (assign,nonatomic) BOOL hide;

+(id)initWithDic:(NSDictionary *)dic;

@end
