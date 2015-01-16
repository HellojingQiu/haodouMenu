//
//  NSString+CBString.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "NSString+CBString.h"

@implementation NSString (CBString)

#pragma mark 拼接字符串
/**
 输入key拼接字符串
 例：str=1.png key=_no  
 return 1_no.png
 */
-(NSString *)appendStringByKey:(NSString *)key str:(NSString *)str
{
    //取后缀名
    NSString *ext=[str pathExtension];
    //取没有后缀的字符串
    NSString *noext=[str stringByDeletingPathExtension];
    //拼接key
    noext=[NSString stringWithFormat:@"%@%@",noext,key];
    noext=[NSString stringWithFormat:@"%@.%@",noext,ext];
    
    return noext;
}
@end
