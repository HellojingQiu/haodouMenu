//
//  UserCookBookCenterViewController.h
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
//菜谱
#define kUserInfo2_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404649651&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=RecipeUser.getUserRecipeList"
#define kUserInfo2BodyStr [NSString stringWithFormat:@"userid=%@&limit=20&offset=0",self.userId]

//用户信息
#define kUserInfo_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404702417&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=RecipeUser.getuserinfo"
#define kUserInfoBodyStr [NSString stringWithFormat:@"userid=%@&uid=5361490&sign=cc369e21ce835c4e66ff9dd4949ee70a&ssid=68e700accfb9dcdd825f15a436ca283b",self.userId]

//成果照
#define kUserPhontCnt_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404724812&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Recipephoto.getList"
#define kUserPhontCntBodyStr [NSString stringWithFormat:@"userid=%@&ssid=68e700accfb9dcdd825f15a436ca283b&uid=5361490&sign=cc369e21ce835c4e66ff9dd4949ee70a&limit=20&offset=0",self.userId]

//关注
#define kUserFollowCnt_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404724812&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=RecipeUser.getFollowsV3"
#define kUserFollowBodyStr [NSString stringWithFormat:@"userid=%@&ssid=68e700accfb9dcdd825f15a436ca283b&uid=5361490&sign=cc369e21ce835c4e66ff9dd4949ee70a&limit=20&offset=0",self.userId]

//粉丝
#define kUserFans_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404724812&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=RecipeUser.getFansV3"
#define kUserfansBodyStr [NSString stringWithFormat:@"userid=%@&ssid=68e700accfb9dcdd825f15a436ca283b&uid=5361490&sign=cc369e21ce835c4e66ff9dd4949ee70a&limit=20&offset=0",self.userId]

@interface UserCookBookCenterViewController : UIViewController

@property (copy,nonatomic) NSString *userId;
@property (copy,nonatomic) NSString *userName;
@end
