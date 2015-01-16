//
//  BaseViewController.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kBackImage  @"main_menu_icon_back.png"
#define kBackHomeImage @"main_ico_menu_home.png"
#define kTabbarSpace 20
#define kBtnWidth 50
@protocol BaseViewControllerDataLoadSuccessDelegate <NSObject>

-(void)dataLoadSuccess;

@end

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSString *_url;
    NSArray *_dataArray;
    UITableView *_outUserTableView;
    id _json;
}

@property (strong,nonatomic,readonly) UITableView *outUserTableView;

@property (assign,nonatomic) id<BaseViewControllerDataLoadSuccessDelegate> delegate;

-(void)loadData;

-(void)loadData:(UIView *)view;

@end
