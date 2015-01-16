//
//  MenuSpecial.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuSpecial : NSObject

@property (copy,nonatomic) NSString *avatar;
@property (copy,nonatomic) NSString *cover;
@property (assign,nonatomic) NSInteger rid;
@property (assign,nonatomic) NSInteger recipeCount;
@property (copy,nonatomic) NSString *title;
@property (assign,nonatomic) NSInteger userId;
@property (copy,nonatomic) NSString *userName;

+(id)initWithDic:(NSDictionary *)dic;

@end
