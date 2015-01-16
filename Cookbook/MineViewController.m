//
//  MineViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MineViewController.h"
#import "SubItem.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#define kMaraginHeight 10
#define kLoginIcon @"nodata_default"
#define kBtnTag 2000
@interface MineViewController ()
{
    //子控件图标名称数组
    NSArray *_arrayIcon;
    //子控件图标名称标题
    NSArray *_arrayTitle;
    //登陆背景图片
    UIImageView *_loginBgImage;
    //个人菜谱中心
    UIImageView *_mineCenter;
}
@end

@implementation MineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"个人中心";
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Default_yycz.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //子控件的图片名称
    _arrayIcon=@[@"icon_center_menu_love_on",
                     @"menu_ico_publish",
                     @"icon_center_menu_dynamic_on",
                     @"icon_center_menu_recipe_on",
                     @"icon_center_menu_result_on",
                     @"ico_search_minute"];
    //子控件的标题
    _arrayTitle=@[@"我的收藏",
                  @"设置",
                  @"动态",
                  @"我的菜谱",
                  @"我的成果照",
                  @"扫一扫"];
    
    //添加登陆背景
    [self addLoginBg];
    
    //添加下面的子控件
    [self addSubItems];
    
    //添加登陆注册
    [self addLoginIcon];
    
}
#pragma mark 添加登陆头像按钮
-(void)addLoginIcon
{
    //登陆头像
    UIImageView *iconImage=[[UIImageView alloc] init];
    iconImage.image=[UIImage imageNamed:kLoginIcon];
    iconImage.center=CGPointMake(_loginBgImage.frame.size.width/2, _loginBgImage.frame.size.height/2-20);
    iconImage.bounds=CGRectMake(0, 0, 60, 60);
    iconImage.layer.cornerRadius=30;
    iconImage.layer.masksToBounds=YES;
    iconImage.userInteractionEnabled=YES;
    UITapGestureRecognizer *loginTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginClick)];
    [iconImage addGestureRecognizer:loginTap];
    [_loginBgImage addSubview:iconImage];
    
    
    UILabel *label=[[UILabel alloc] init];
    label.text=@"登陆/注册";
    label.center=CGPointMake(_loginBgImage.frame.size.width/2, _loginBgImage.frame.size.height/2+20);
    label.bounds=CGRectMake(0, 0, 100, 100);
    label.font=[UIFont systemFontOfSize:14];
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    [_loginBgImage addSubview:label];
}

#pragma mark 登陆
-(void)loginClick
{
    LoginViewController *loginVc=[[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVc animated:YES];
}

#pragma mark 添加登陆背景
-(void)addLoginBg
{
    _loginBgImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_bg.jpg"]];
    _loginBgImage.frame=CGRectMake(0, 64, self.view.frame.size.width, 160);
    _loginBgImage.userInteractionEnabled=YES;
    [self.view addSubview:_loginBgImage];
    
    _mineCenter=[[UIImageView alloc] init];
    _mineCenter.frame=CGRectMake(0, CGRectGetMaxY(_loginBgImage.frame)+kMaraginHeight, self.view.frame.size.width, 50);
    _mineCenter.backgroundColor=[UIColor whiteColor];
    UILabel *label=[[UILabel alloc] init];
    label.text=@"个人菜谱中心";
    label.center=CGPointMake(_mineCenter.frame.size.width/2, _mineCenter.frame.size.height/2);
    label.bounds=_mineCenter.bounds;
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:20];
    label.textColor=kGetColor(0.4902, 0.6353, 0.1686, 1);
    [_mineCenter addSubview:label];
    [self.view addSubview:_mineCenter];
}

#pragma mark 添加子控件
-(void)addSubItems
{
    CGFloat itemWidth=kScreenWidth/3;
    CGFloat itemHeight=(kScreenHeight-(CGRectGetMaxY(_mineCenter.frame)+2*kMaraginHeight)-50)/2;
    CGFloat itemy=CGRectGetMaxY(_mineCenter.frame)+kMaraginHeight;
    int iconIndex=0;
    for (int i=0; i<2; i++) {
        for (int j=0; j<3; j++) {
            SubItem *item=[[SubItem alloc] init];
            [item setImage:[UIImage imageNamed:_arrayIcon[iconIndex]] forState:UIControlStateNormal];
            item.backgroundColor=[UIColor whiteColor];
            [item setTitle:_arrayTitle[iconIndex] forState:UIControlStateNormal];
            item.frame=CGRectMake(itemWidth*j, itemy+i*itemHeight, itemWidth, itemHeight);
            item.tag=kBtnTag+iconIndex;
            [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
            [self.view addSubview:item];
            iconIndex++;
        }
        //添加中线
        if (i==1) {
            UIImageView *line=[[UIImageView alloc] init];
            UIImage *lineImage= kLineImage;
            line.image=[lineImage stretchableImageWithLeftCapWidth:2 topCapHeight:2];
            line.frame=CGRectMake(0, itemy+i*itemHeight, kScreenWidth, 1);
            [self.view addSubview:line];
        }
    }
    
    //画渐变线
    for (int j=1; j<3; j++) {
        UIImageView *shadeLine=[[UIImageView alloc] initWithFrame:CGRectMake(itemWidth*j, itemy, 1, 2*itemHeight)];
        shadeLine.image=kLineImage;
        shadeLine.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:shadeLine];
    }
}

#pragma mark 按钮点击事件
-(void)itemClick:(UIButton *)btn
{
    switch (btn.tag-2000) {
        //收藏
        case 0:
        {
        
        }
            break;
        //设置
        case 1:
        {
            SettingViewController *setting=[[SettingViewController alloc] init];
            [self.navigationController pushViewController:setting animated:YES];
        }
            break;
        //动态
        case 2:
        {
            
        }
            break;
        //我的菜谱
        case 3:
        {
            
        }
            break;
        //晒一晒
        case 4:
        {
            
        }
            break;
        //扫一扫
        case 5:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
