//
//  BottomModule.h
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BottomModule : NSObject

@property (copy,nonatomic) NSString *image;
@property (copy,nonatomic) NSString *title;
@property (assign,nonatomic) NSInteger type;
@property (copy,nonatomic) NSString *url;

+(id)initWithDic:(NSDictionary *)dic;

@end
