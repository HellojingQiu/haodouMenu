//
//  UIUtils.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef  enum
{
    NoNetWork,
    NetWork3G,
    NetWorkWify
}CurrectNetworkStatus;
@interface UIUtils : NSObject

+(NSString *)getDecumentPath:(NSString *)path;

//数据分析用
+(void)testData:(NSString *)requestUrl fileName:(NSString *)fileName;

//网络请求
+(BOOL)loadDataByUrl:(NSString *)urlStr success:(void(^)(id JsonData))success failed:(void(^)())failed;
//加载指示器
+(void)showHudWithTitle:(NSString *)title view:(UIView *)view;
//移除指示器
+(void)hiddenHudWithView:(UIView *)view;

+(void)showHudWithTitle:(NSString *)title success:(BOOL)isSuc;

+(CGSize)sizeOfStr:(NSString *)str andFont:(UIFont *)font andMaxSize:(CGSize)size andLineBreakMode:(NSLineBreakMode)mode;
//查看当前网络状态
+(CurrectNetworkStatus)getNetWorkState;

@end
