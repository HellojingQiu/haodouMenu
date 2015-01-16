//
//  UserCookBookCenterViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "UserCookBookCenterViewController.h"
#import "UserInfo.h"
#import "FansTableViewController.h"
#import "UserRecipeTableViewController.h"
#import "MenuDetialViewController.h"
#import "AchievementPicModel.h"
#define kBackImage  @"main_menu_icon_back.png"
#define kBackHomeImage @"main_ico_menu_home.png"
#define kTabbarSpace 20
#define kBtnWidth 50
#define kPageItemsName @[@"菜谱",@"成果照",@"关注",@"粉丝"]
#define kPageItemsCount @[_userInfo.recipeCnt,_userInfo.photoCnt,_userInfo.followCnt,_userInfo.fansCount]
#define kPageCount 4
#define kImageIconWidth 60
#define kImageVip [UIImage imageNamed:@"ico_vip_mark.png"]
#define kImageWeight [UIImage imageNamed:@"ico_horn_money.png"]
#define kPageTag 400
@interface UserCookBookCenterViewController ()
{
    UIScrollView *_scrollView;
    
    UIView *_tabbar;
    
    UIImageView *_bgImageView;
    
    UserInfo *_userInfo;
    
    UIView *_lineView;
    
    UIView *_placeholderView;
    
    FansTableViewController *_fans;
    
    FansTableViewController *_follows;
    
    UIViewController *_currect;
    
    UserRecipeTableViewController *_userRecipe;
    
    UserRecipeTableViewController *_achievementPic;
    
    CGFloat firstPloHeight;
}
@end

@implementation UserCookBookCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    _scrollView=[[UIScrollView alloc] init];
    _scrollView.frame=CGRectMake(0, 0, self.view.frame.size.width, kScreenHeight-kTabBarHeight-14);
//    _scrollView.bounces=NO;
    [self.view addSubview:_scrollView];
    self.title=self.userName;
    self.view.backgroundColor=[UIColor whiteColor];
    //添加标签栏
    [self initSubTabbar];
    //加载用户基本信息
    [self loadUserInfo];
    
    __weak UserCookBookCenterViewController *weakVc=self;
    _fans=[[FansTableViewController alloc] init];
    _fans.view.backgroundColor=kAllBgColor;
    _fans.url=[NSString stringWithFormat:@"%@&%@",kUserFans_URL,kUserfansBodyStr];
    _fans.opeartionFans=^(NSInteger newUserId,NSString *userName)
    {
        UserCookBookCenterViewController *newWeakVc=[[UserCookBookCenterViewController alloc] init];
        newWeakVc.userName=userName;
        newWeakVc.userId=[NSString stringWithFormat:@"%d",newUserId];
        [weakVc.navigationController pushViewController:newWeakVc animated:YES];
    };
    
    _follows=[[FansTableViewController alloc] init];
    _follows.view.backgroundColor=kAllBgColor;
    _follows.url=[NSString stringWithFormat:@"%@&%@",kUserFollowCnt_URL,kUserFollowBodyStr];
    _follows.opeartionFans=^(NSInteger newUserId,NSString *userName)
    {
        UserCookBookCenterViewController *newWeakVc=[[UserCookBookCenterViewController alloc] init];
        newWeakVc.userName=userName;
        newWeakVc.userId=[NSString stringWithFormat:@"%d",newUserId];
        [weakVc.navigationController pushViewController:newWeakVc animated:YES];
    };
    
    _userRecipe=[[UserRecipeTableViewController alloc] init];
    _userRecipe.view.backgroundColor=kAllBgColor;
    _userRecipe.url=[NSString stringWithFormat:@"%@&%@",kUserInfo2_URL,kUserInfo2BodyStr];
    _userRecipe.opeartion=^(NSString *titile,NSInteger rid)
    {
        MenuDetialViewController *searchResultVc=[[MenuDetialViewController alloc] init];
        searchResultVc.menuTitle=titile;
        searchResultVc.rid=rid;
        [weakVc.navigationController pushViewController:searchResultVc animated:YES];
    };
    
    _achievementPic=[[UserRecipeTableViewController alloc] init];
    _achievementPic.view.backgroundColor=kAllBgColor;
    _achievementPic.url=[NSString stringWithFormat:@"%@&%@",kUserPhontCnt_URL,kUserPhontCntBodyStr];
    _achievementPic.modelClass=[AchievementPicModel class];
}

#pragma mark 加载用户信息
-(void)loadUserInfo
{
    NSString *url=[NSString stringWithFormat:@"%@&%@",kUserInfo_URL,kUserInfoBodyStr];
    [UIUtils loadDataByUrl:url success:^(id JsonData) {
        
        NSDictionary *dic=JsonData[@"result"][@"info"];
        _userInfo=[UserInfo initWithDic:dic];
        self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, kScreenHeight-14);
        //初始化控件
        [self initItems];
        
    } failed:^{
        
    }];
}

-(void)initItems
{
    //添加顶部
    [self addTopBg];
    //添加分页栏
    [self addPageBar];
    //添加占位视图
    [self addPlaceholderView];
    //设置第一个菜谱
    [self firstLoadData];
}

#pragma mark 添加占位视图
-(void)addPlaceholderView
{
    _placeholderView=[[UIView alloc] init];
    _placeholderView.frame=CGRectMake(0, CGRectGetMaxY(_lineView.frame), self.view.frame.size.width, CGRectGetMaxY(_tabbar.frame)-CGRectGetMaxY(_lineView.frame)-kTabBarHeight);
//    _placeholderView.backgroundColor=[UIColor redColor];
    [_scrollView addSubview:_placeholderView];
    firstPloHeight=CGRectGetMaxY(_tabbar.frame)-CGRectGetMaxY(_lineView.frame)-kTabBarHeight;
}

#pragma mark 添加顶部的
-(void)addTopBg
{
    _bgImageView=[[UIImageView alloc] init];
    _bgImageView.image=[UIImage imageNamed:@"user_bg.jpg"];
    _bgImageView.frame=CGRectMake(0, 0, self.view.frame.size.width, 160);
    
    UIImageView *iconImage=[[UIImageView alloc] init];
    [iconImage setImageWithURL:[NSURL URLWithString:_userInfo.avatar] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
    
    iconImage.frame=CGRectMake((self.view.frame.size.width-kImageIconWidth)/2, 35, kImageIconWidth, kImageIconWidth);
    iconImage.layer.cornerRadius=kImageIconWidth/2;
    iconImage.layer.masksToBounds=YES;
    [_bgImageView addSubview:iconImage];
    //vip图标
    UIImageView *vip=[[UIImageView alloc] init];
    vip.image=kImageVip;
    vip.frame=CGRectMake(90, CGRectGetMaxY(iconImage.frame)+10, 16,16);
    [_bgImageView addSubview:vip];
    
    //用户名
    UILabel *userName=[[UILabel alloc] init];
    userName.text=_userInfo.userName;
    userName.textColor=[UIColor whiteColor];
    CGSize size=[UIUtils sizeOfStr:_userInfo.userName andFont:[UIFont systemFontOfSize:12] andMaxSize:CGSizeMake(150, 20) andLineBreakMode:NSLineBreakByWordWrapping];
    CGFloat nameWidth=70;
    if (size.width>70) {
        nameWidth=size.width;
    }
    userName.frame=CGRectMake(CGRectGetMaxX(vip.frame)+5, CGRectGetMaxY(iconImage.frame)+8, nameWidth, 20);
    userName.backgroundColor=[UIColor clearColor];
    userName.font=[UIFont systemFontOfSize:12];
    [_bgImageView addSubview:userName];
    
    UIImageView *moneyIcon=[[UIImageView alloc] init];
    moneyIcon.frame=CGRectMake(CGRectGetMaxX(userName.frame), CGRectGetMaxY(iconImage.frame)+10, 16, 16);
    moneyIcon.image=kImageWeight;
    [_bgImageView addSubview:moneyIcon];
    
    UILabel *money=[[UILabel alloc] init];
    money.text=[NSString stringWithFormat:@"%d",_userInfo.wealth];
    money.font=[UIFont systemFontOfSize:12];
    money.textColor=[UIColor whiteColor];
    money.frame=CGRectMake(CGRectGetMaxX(moneyIcon.frame)+5, CGRectGetMaxY(iconImage.frame)+8, 70, 20);
    [_bgImageView addSubview:money];
    
    [_scrollView addSubview:_bgImageView];
}

#pragma mark 添加分页栏
-(void)addPageBar
{
    NSArray *array=@[
                     [NSString stringWithFormat:@"%d",_userInfo.recipeCnt],
                     [NSString stringWithFormat:@"%d",_userInfo.photoCnt],
                     [NSString stringWithFormat:@"%d",_userInfo.followCnt],
                     [NSString stringWithFormat:@"%d",_userInfo.fansCount]
                     ];
    CGFloat width=(self.view.frame.size.width-3)/kPageCount;
    CGFloat y=CGRectGetMaxY(_bgImageView.frame);
    UIView *pageButton;
    for (int i=0; i<kPageCount; i++) {
        pageButton=[[UIView alloc] init];
        pageButton.backgroundColor=kAllBgColor;
        pageButton.frame=CGRectMake((width+1)*i, y, width, kTabBarHeight);
        pageButton.tag=kPageTag+i;
        //添加点击事件
        UITapGestureRecognizer *pageTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageClick:)];
        [pageButton addGestureRecognizer:pageTap];
        
        UILabel *countLabel=[[UILabel alloc] init];
        countLabel.frame=CGRectMake(0, 3, width, kTabBarHeight/2);
        countLabel.text=array[i];
        countLabel.font=[UIFont systemFontOfSize:12];
        countLabel.textAlignment=NSTextAlignmentCenter;
        countLabel.textColor=kGetColor(0.1451, 0.5961, 0.1569, 1);
        [pageButton addSubview:countLabel];
        
        UILabel *des=[[UILabel alloc] init];
        des.frame=CGRectMake(0, kTabBarHeight/2-3, width, kTabBarHeight/2);
        des.text=kPageItemsName[i];
        des.textColor=[UIColor darkGrayColor];
        des.font= [UIFont systemFontOfSize:16];
        des.textAlignment=NSTextAlignmentCenter;
        [pageButton addSubview:des];
        [_scrollView addSubview:pageButton];
    }
    
    _lineView=[[UIView alloc] init];
    _lineView.backgroundColor=kGetColor(0.0784, 0.5647, 0.0902, 1);
    _lineView.frame=CGRectMake(0, CGRectGetMaxY(pageButton.frame), width, 2);
    [_scrollView addSubview:_lineView];
}

#pragma mark 第一次进入 设置
-(void)firstLoadData
{
    _userRecipe.view.frame=(CGRect){CGPointZero,{kScreenWidth,[_userRecipe getMaxHeight]}};
    [_placeholderView addSubview:_userRecipe.view];
    _scrollView.contentSize=CGSizeMake(0, _scrollView.frame.size.height+([_userRecipe getMaxHeight]-_placeholderView.frame.size.height));
    _currect=_userRecipe;
}

#pragma mark 点击事件切换
-(void)pageClick:(UITapGestureRecognizer *)tap
{
    UIView *view=(UIView *)tap.view;
    CGRect newFrame=_lineView.frame;
    newFrame.origin.x=(view.tag-kPageTag)*(((self.view.frame.size.width-3)/kPageCount)+1);
    [UIView animateWithDuration:0.3 animations:^{
        _lineView.frame=newFrame;
    }];
    [_currect.view removeFromSuperview];
//    CGRect placeholder=_placeholderView.frame;
    
    int index=view.tag-400;
    //菜谱
    if (index==0) {
        
        _userRecipe.view.frame=(CGRect){CGPointZero,{kScreenWidth,[_userRecipe getMaxHeight]}};
         _placeholderView.frame=(CGRect){{_placeholderView.frame.origin.x,_placeholderView.frame.origin.y},{kScreenWidth,[_userRecipe getMaxHeight]}};
        [_placeholderView addSubview:_userRecipe.view];
        _scrollView.contentSize=CGSizeMake(0, _scrollView.frame.size.height+([_userRecipe getMaxHeight]-firstPloHeight));
        _currect=_userRecipe;
    }
    //成果照
    else if (index==1)
    {
        _achievementPic.view.frame=(CGRect){CGPointZero,{kScreenWidth,[_achievementPic getMaxHeight]}};
        _placeholderView.frame=(CGRect){{_placeholderView.frame.origin.x,_placeholderView.frame.origin.y},{kScreenWidth,[_achievementPic getMaxHeight]}};
        [_placeholderView addSubview:_achievementPic.view];
        _scrollView.contentSize=CGSizeMake(0, _scrollView.frame.size.height+([_achievementPic getMaxHeight]-firstPloHeight));
        _currect=_achievementPic;
    }
    //关注
    else if(index==2)
    {
        _follows.view.frame=(CGRect){CGPointZero,{kScreenWidth,[_follows getViewHeight]}};
        _placeholderView.frame=(CGRect){{_placeholderView.frame.origin.x,_placeholderView.frame.origin.y},{kScreenWidth,[_follows getViewHeight]}};
        [_placeholderView addSubview:_follows.view];
        
        _scrollView.contentSize=CGSizeMake(0, _scrollView.frame.size.height+([_fans getViewHeight]-firstPloHeight));
        
        _currect=_follows;
    }
    //粉丝
    else if(index==3)
    {
        _fans.view.frame=(CGRect){CGPointZero,{kScreenWidth,[_fans getViewHeight]}};
        _placeholderView.frame=(CGRect){{_placeholderView.frame.origin.x,_placeholderView.frame.origin.y},{kScreenWidth,[_fans getViewHeight]}};
        [_placeholderView addSubview:_fans.view];
        
        _scrollView.contentSize=CGSizeMake(0, _scrollView.frame.size.height+([_fans getViewHeight]-firstPloHeight));
        
        _currect=_fans;
    }
}

#pragma mark 非rootViewController的工具条
-(void)initSubTabbar
{
    _tabbar=[[UIView alloc] init];
    _tabbar.frame=CGRectMake(0, self.view.frame.size.height-2*kTabBarHeight-14, self.view.frame.size.width, kTabBarHeight);
    _tabbar.backgroundColor=[UIColor whiteColor];
    UIImageView *lineImageView=[[UIImageView alloc] init];
    lineImageView.image=kLineImage;
    lineImageView.frame=CGRectMake(0, 0, kScreenWidth, 1);
    [_tabbar addSubview:lineImageView];
    
    //返回上级controller
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:kBackImage] forState:UIControlStateNormal];
    backBtn.frame=CGRectMake(kTabbarSpace, 0, kBtnWidth, kTabBarHeight);
    backBtn.tag=10;
    [backBtn addTarget:self action:@selector(btnBackClick:) forControlEvents:UIControlEventTouchDown];
    [_tabbar addSubview:backBtn];
    //返回主controller
    UIButton *backHome= [UIButton buttonWithType:UIButtonTypeCustom];
    [backHome setImage:[UIImage imageNamed:kBackHomeImage] forState:UIControlStateNormal];
    backHome.frame=CGRectMake(self.view.frame.size.width-kBtnWidth-kTabbarSpace, 0, kBtnWidth, kTabBarHeight);
    backHome.tag=11;
    [backHome addTarget:self action:@selector(btnBackClick:) forControlEvents:UIControlEventTouchDown];
    [_tabbar addSubview:backHome];
    [self.view addSubview:_tabbar];
}

-(void)btnBackClick:(UIButton *)btn
{
    if (btn.tag==10) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else if (btn.tag==11)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


@end
