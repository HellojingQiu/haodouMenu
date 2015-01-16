//
//  HomeViewController.h
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

//首页数据请求地址
#define kHOME_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404277925&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Suggest.recipeV3"
/**
 *  1.最上面的滑动图为数据字典的recipe_list
 *  2.排行榜 营养餐桌 发布菜谱 晒一晒 为死数据
 *  3.下面分类条 为数据字典中得tag_list(&tagid=504&keyword=&limit=20&offset=0)
 *  4.菜谱专辑 为数据字典中得 collect_list
 *  5.厨房宝典 为数据字典中得 wiki_list
 */

@interface HomeViewController : UIViewController

@end
