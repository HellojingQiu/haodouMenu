//
//  UIUtils.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "UIUtils.h"
#import "MBProgressHUD.h"
#import "Reachability.h"

@implementation UIUtils

/**
 获取沙盒中得某个文件的路径
 */
+(NSString *)getDecumentPath:(NSString *)path;
{
    NSString *str=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    str=[str stringByAppendingPathComponent:path];
    
    return str;
}

#pragma mark 封装网络请求
/**
 *  封装网络请求
 *
 *  @param url     链接地址
 *  @param success 成功执行的block
 *  @param failed  失败执行的block
 */
+(BOOL)loadDataByUrl:(NSString *)urlStr success:(void(^)(id JsonData))success failed:(void(^)())failed;
{
    BOOL flag=true;
    NSURL *url=[NSURL URLWithString:urlStr];
    CurrectNetworkStatus netWork= [self getNetWorkState];
    if (url==nil) {
        url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    NSMutableURLRequest *request;
    //没有连接网络
    if (netWork==NoNetWork) {
        request  = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataDontLoad timeoutInterval:20];
        flag=false;
    }
    else
    {
        request  = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        flag=true;
    }
    
    AFJSONRequestOperation *operation=[AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        //成功执行代码
        success(JSON);
        //        [self showHudWithTitle:@"加载成功" success:YES];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        ILLog(@"%@",error.localizedDescription);
        //失败执行代码
        failed();
        
    }];
    [operation start];
    
    return flag;
}

#pragma mark 获取当前网络状态
+(CurrectNetworkStatus)getNetWorkState
{
    Reachability *r=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
            //没有网络
        case NotReachable:
            return NoNetWork;
            break;
            //3G网络
        case ReachableViaWWAN:
            return NetWork3G;
            break;
            // 使用WiFi网络
        case ReachableViaWiFi:
            return NetWorkWify;
        default:
            return NoNetWork;
            break;
    }
    
}

#pragma mark 封装指示器
+(void)showHudWithTitle:(NSString *)title view:(UIView *)view
{
    [MBProgressHUD showHUDAddedTo:view animated:YES].labelText=title;
}

#pragma mark 成功失败指示器
+(void)showHudWithTitle:(NSString *)title success:(BOOL)isSuc
{
    //成功
    if (isSuc) {
        [MBProgressHUD showSuccessWithTitle:title];
    }
    //失败
    else
    {
        [MBProgressHUD showErrorWithTitle:title];
    }
}

#pragma mark 移除指示器
+(void)hiddenHudWithView:(UIView *)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

#pragma mark 根据字符串计算size
+(CGSize)sizeOfStr:(NSString *)str andFont:(UIFont *)font andMaxSize:(CGSize)size andLineBreakMode:(NSLineBreakMode)mode
{
    CGSize s;
    if ([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0) {
        NSMutableDictionary  *mdic=[NSMutableDictionary dictionary];
        [mdic setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
        [mdic setObject:font forKey:NSFontAttributeName];
        s = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:mdic context:nil].size;
    }
    else
    {
        s=[str sizeWithFont:font constrainedToSize:size lineBreakMode:mode];
    }
    return s;
}

#pragma mark 测试数据用
/**
 *  初期分析数据用 分析完毕后不要在调用
 *  并且把沙盒中得textdata.plist删除
 *  @param requestUrl 请求地址
 */
+(void)testData:(NSString *)requestUrl fileName:(NSString *)fileName
{
    NSString *path= [UIUtils getDecumentPath:fileName];
    NSURL *url=[NSURL URLWithString:requestUrl];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation=[AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSDictionary *dic=JSON;
        [dic writeToFile:path atomically:YES];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
    }];
    [operation start];
}

@end
