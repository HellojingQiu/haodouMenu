//
//  SubDetialView.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubDetialView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (strong,nonatomic) id model;
@property (copy,nonatomic) void(^cellClick)(id model);
+(id)initWithNib;

@end
