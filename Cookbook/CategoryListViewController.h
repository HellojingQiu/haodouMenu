//
//  CategoryListViewController.h
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "LatelySearchController.h"

@interface CategoryListViewController : LatelySearchController

@property (strong,nonatomic) NSArray *categoryItems;
@property (copy,nonatomic) NSString *cateTitle;

@end
