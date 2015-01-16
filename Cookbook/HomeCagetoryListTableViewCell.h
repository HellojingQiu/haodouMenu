//
//  HomeCagetoryListTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeDetialItem;
@interface HomeCagetoryListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *viewCount;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;

@property (strong,nonatomic) HomeDetialItem *homeDetialItem;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
