//
//  MenuViewModel.h
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuViewModel : NSObject

@property (copy,nonatomic) NSString *cover;
@property (assign,nonatomic) NSInteger rid;
@property (copy,nonatomic) NSString *title;

+(id)initWithDic:(NSDictionary *)dic;

@end
