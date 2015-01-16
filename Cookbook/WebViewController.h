//
//  WebViewController.h
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

//-----------------重要-----------------------------
//url设定必须在title前 因为网络请求在设置title的时候做得请求
#import "BaseViewController.h"

@interface WebViewController : BaseViewController

@property (copy,nonatomic) NSString *webUrl;
@property (copy,nonatomic) NSString *webTitle;

@end
