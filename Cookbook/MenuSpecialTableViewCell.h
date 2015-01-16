//
//  MenuSpecialTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuSpecial;
@interface MenuSpecialTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

@property (weak, nonatomic) IBOutlet UILabel *recipeCount;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *uaerName;

@property (strong,nonatomic) MenuSpecial *menuSpecial;

@end
