//
//  ShakeTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShakeModel;
@interface ShakeTableViewCell : UITableViewCell

@property (strong,nonatomic) ShakeModel *shakeModel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *des;


@end
