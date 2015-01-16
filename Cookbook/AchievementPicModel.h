//
//  AchievementPicModel.h
//  Cookbook
//
//  Created by chengfang on 14-12-8.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuViewModel.h"
@interface AchievementPicModel : MenuViewModel

@property (copy,nonatomic) NSString *comment;
@property (copy,nonatomic) NSString *createTime;
@property (copy,nonatomic) NSString *photoUrl;
@property (assign,nonatomic) NSInteger recipeId;
@property (assign,nonatomic) NSInteger recipePhotoId;
@property (copy,nonatomic) NSString *title;

+(id)initWithAchievementDic:(NSDictionary *)dic;

@end
