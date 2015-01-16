//
//  AdData.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdData : NSObject

@property (copy,nonatomic) NSString *image;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *url;

+(id)initWithDic:(NSDictionary *)dic;

@end
