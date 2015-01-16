//
//  CategoryModel.h
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property (copy,nonatomic) NSString *cate;
@property (copy,nonatomic) NSString *imageUrl;
@property (strong,nonatomic) NSArray *tags;

+(id)initWithDic:(NSDictionary *)dic;

@end
