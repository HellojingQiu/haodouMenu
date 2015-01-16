//
//  FansTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FansTableViewCell : UITableViewCell

@property (strong,nonatomic) NSArray *dataArray;

@property (copy,nonatomic) void(^opeartion)();

@end
