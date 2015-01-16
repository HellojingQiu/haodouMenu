//
//  MBProgressHUD+Show.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MBProgressHUD+Show.h"

@implementation MBProgressHUD (Show)

+(void)showTextWithTitle:(NSString *)title iconName:(NSString *)icon
{
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    //设置hud的显示模式
    hud.mode=MBProgressHUDModeCustomView;
    //设置背景图片
    icon=[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon];
    
    hud.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    hud.labelText=title;
    //设置当隐藏的时候移除
    hud.removeFromSuperViewOnHide=YES;
    //设置延时隐藏
    [hud hide:YES afterDelay:0.5];
}

#pragma mark 成功时候显示
+(void)showSuccessWithTitle:(NSString *)title
{
    [self showTextWithTitle:title iconName:@"success.png"];
}

#pragma mark 失败的时候显示
+(void)showErrorWithTitle:(NSString *)title
{
    [self showTextWithTitle:title iconName:@"error.png"];
}

@end
