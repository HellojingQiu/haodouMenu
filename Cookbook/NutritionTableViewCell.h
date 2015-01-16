//
//  NutritionTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NutritionModel;
@interface NutritionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titile;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (strong,nonatomic) NutritionModel *nutModel;

@end
