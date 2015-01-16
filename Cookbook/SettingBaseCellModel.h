//
//  SettingBaseCellModel.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingBaseCellModel : NSObject

@property (copy,nonatomic) NSString *cellTitle;
@property (copy,nonatomic) NSString *cellImage;

+(id)initWithTitle:(NSString *)title image:(NSString *)imageName;

@end
