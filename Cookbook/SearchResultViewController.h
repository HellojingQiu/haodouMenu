//
//  SearchResultViewController.h
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchResultViewController : BaseViewController<BaseViewControllerDataLoadSuccessDelegate>

@property (copy,nonatomic) NSString *requestUrl;
@property (copy,nonatomic) NSString *keyWorld;

@end
