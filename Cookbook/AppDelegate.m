//
//  AppDelegate.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "Reachability.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // 监测网络情况
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name: kReachabilityChangedNotification
                                               object: nil];
    _hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [_hostReach startNotifier];
    
    //注册第三方分享
    [self initThirdPlatform];
    
    MainViewController *mainViewControllr=[[MainViewController alloc] init];

       self.window.rootViewController=mainViewControllr;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    NetworkStatus status = [curReach currentReachabilityStatus];
    
    if (status == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络断开连接"
                                                        message:@"亲,您已经断开网络了"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark 第三方注册
-(void)initThirdPlatform
{
    [ShareSDK registerApp:@"4a0036bbac17"];
    
    //微博分享
    [ShareSDK connectSinaWeiboWithAppKey:@"2651331370" appSecret:@"bcda70393589b0b22225309dbbeda203" redirectUri:@"http://user.qzone.qq.com/595857596?ptlang=2052"];
    
    //人人分享
//    [ShareSDK connectRenRenWithAppId:@"473737"
//                              appKey:@"bd483e8b9a7f4abc80adfff49dcbf003"
//                           appSecret:@"df50934fe3c1421ea7f7324cadb2cace"
//                   renrenClientClass:[RennClient class]];
    
    //连接短信分享
    [ShareSDK connectSMS];
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}

@end
