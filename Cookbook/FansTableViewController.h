//
//  FansTableViewController.h
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FansTableViewController : UITableViewController

@property (copy,nonatomic) NSString *url;

@property (copy,nonatomic) void(^opeartionFans)(NSInteger,NSString *);

-(CGFloat)getViewHeight;

@end
