//
//  KitchenModel.h
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KitchenModel : NSObject

@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *image;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *url;

+(id)initWithDic:(NSDictionary *)dic;

@end
