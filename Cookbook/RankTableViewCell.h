//
//  RankTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-9.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RankUserInfo;
@interface RankTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *rankIcon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *count;

@property (strong,nonatomic) RankUserInfo *userInfo;
@property (assign,nonatomic) int index;

@end
