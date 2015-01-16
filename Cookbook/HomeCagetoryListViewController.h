//
//  HomeCagetoryListViewController.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "BaseViewController.h"
@interface HomeCagetoryListViewController : BaseViewController<BaseViewControllerDataLoadSuccessDelegate>

@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *tagId;

@end
