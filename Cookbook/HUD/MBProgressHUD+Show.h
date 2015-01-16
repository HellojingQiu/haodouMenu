//
//  MBProgressHUD+Show.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Show)

+(void)showTextWithTitle:(NSString *)title iconName:(NSString *)icon;

+(void)showSuccessWithTitle:(NSString *)title;

+(void)showErrorWithTitle:(NSString *)title;

@end
