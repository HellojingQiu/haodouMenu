//
//  UserRecipeTableViewController.h
//  Cookbook
//
//  Created by chengfang on 14-12-8.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserRecipeTableViewController : UITableViewController

@property (copy,nonatomic) NSString *url;

@property (copy,nonatomic) void(^opeartion)();

@property (copy,nonatomic) Class modelClass;
-(CGFloat)getMaxHeight;

@end
