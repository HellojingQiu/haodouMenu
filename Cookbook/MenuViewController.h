//
//  MenuViewController.h
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "BaseViewController.h"

@interface MenuViewController : BaseViewController<BaseViewControllerDataLoadSuccessDelegate>

@property (assign,nonatomic) NSInteger cid;
@property (copy,nonatomic) NSString *mentTitle;

@end
