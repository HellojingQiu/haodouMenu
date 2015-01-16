//
//  MenuIfo.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuIfo : NSObject

//头像
@property (copy,nonatomic) NSString *avatar;
//评论数量
@property (assign,nonatomic) NSInteger commentCount;
//烹饪时间
@property (copy,nonatomic) NSString *cookTime;
//主图像
@property (copy,nonatomic) NSString *cover;
//收藏数量
@property (assign,nonatomic) NSInteger favoriteCount;
//描述
@property (copy,nonatomic) NSString *intro;
//是否被收藏
@property (assign,nonatomic,getter = isFavorited) BOOL isFavorited;
//主要材料
@property (strong,nonatomic) NSArray *mainStuff;
//其他材料
@property (strong,nonatomic) NSArray *otherStuff;
//照片数量
@property (assign,nonatomic) NSInteger photoCount;
//照片
@property (strong,nonatomic) NSArray *photoList;
//准备时间
@property (copy,nonatomic) NSString *readyTime;
//菜谱Id
@property (assign,nonatomic) NSInteger recipeld;
//发布时间
@property (copy,nonatomic) NSString *reviewTime;
//步骤
@property (strong,nonatomic) NSArray *steps;
//全部材料
@property (strong,nonatomic) NSArray *stuff;
//标签
@property (strong,nonatomic) NSArray *tags;
//小贴士
@property (strong,nonatomic) NSString *tips;
//标题
@property (copy,nonatomic) NSString *title;
//类型
@property (assign,nonatomic) NSInteger type;
//用餐人数
@property (copy,nonatomic) NSString *userCount;
//用户ID
@property (assign,nonatomic) NSInteger userId;
//用户名
@property (copy,nonatomic) NSString *userName;
//访问数量
@property (assign,nonatomic) NSInteger viewCount;

+(id)initWithDic:(NSDictionary *)dic;

@end
