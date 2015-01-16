//
//  AppDelegate.h
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
//#import <RennSDK/RennSDK.h>
@class Reachability;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    Reachability  *_hostReach;
}
@property (strong, nonatomic) UIWindow *window;

@end
