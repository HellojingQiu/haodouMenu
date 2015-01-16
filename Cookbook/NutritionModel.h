//
//  NutritionModel.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NutritionModel : NSObject

@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *image;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *url;

+(id)initWithDic:(NSDictionary *)dic;

@end
