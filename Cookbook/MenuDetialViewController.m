//
//  MenuDetialViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuDetialViewController.h"
#import "CBTabBar.h"
#import "MenuDetial.h"
#import "MenuIfo.h"
#import "MenuDetialView.h"
#import "MenuDetialViewFrame.h"
#import "WebViewController.h"
#import "AdData.h"
#import "HomeCagetoryListViewController.h"
#import "Tag.h"
#import "AllCommentViewController.h"
#import "UserCookBookCenterViewController.h"
#import <ShareSDK/ShareSDK.h>
#define kMenuDetail_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404474143&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Info.getInfoV3&rid="

#define kImageViewHeight 200

@interface MenuDetialViewController ()
{
    CBTabBar *_cbTabBar;
    UIScrollView *_scrollView;
    MenuDetial *_menuDetial;
    UIImageView *_topImageView;
}
@end

@implementation MenuDetialViewController

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
    self.navigationItem.hidesBackButton = YES;
    self.view.backgroundColor=kAllBgColor;

    _scrollView=[[UIScrollView alloc] init];
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50);
    _scrollView.bounces=NO;
    [self.view addSubview:_scrollView];
    //子tabbar初始化
    [self addTabBar];
}

#pragma mark 添加Tabbar(非rootViewController)
-(void)addTabBar
{
    //self.view.frame.size.height-kTabBarHeight
    _cbTabBar=[[CBTabBar alloc] init];
    _cbTabBar.frame=CGRectMake(0,self.view.frame.size.height-kTabBarHeight-64, self.view.frame.size.width, kTabBarHeight);
    __weak MenuDetialViewController *weekVc=self;
    _cbTabBar.itemClickBlock=^(int tag)
    {
        [weekVc itemClick:tag];
    };
    [self.view addSubview:_cbTabBar];
    //添加itemes
    [self addItems];
}

#pragma mark 添加子items
-(void)addItems
{
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_icon_back.png"];
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_ico_love.png"];
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_ico_comment.png"];
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_ico_list.png"];
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_ico_share.png"];
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_icon_home.png"];
}

#pragma mark 重写setRid 加载数据
-(void)setRid:(NSInteger)rid
{
    _rid=rid;
    self.title=_menuTitle;
    
    [self loadData];
}

#pragma mark 加载数据
-(void)loadData
{
    NSString *url=[NSString stringWithFormat:@"%@%ld",kMenuDetail_URL,_rid];
    
//    [UIUtils showHudWithTitle:@"正在加载...." view:self.view];
    [UIUtils loadDataByUrl:url success:^(id JsonData) {
       
        _menuDetial=[MenuDetial initWithDic:JsonData[@"result"]];
        [self addTopImageView];
        
        [self AddMenuDetialView];
        [UIUtils hiddenHudWithView:self.view];
    } failed:^{
        [UIUtils hiddenHudWithView:self.view];
    }];
}

#pragma mark添加顶部图片
-(void)addTopImageView
{
    UIImageView *imageView=[[UIImageView alloc] init];
    [imageView setImageWithURL:[NSURL URLWithString:_menuDetial.info.cover] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageLowPriority|SDWebImageRetryFailed];
    imageView.frame=CGRectMake(0, 0, self.view.frame.size.width, kImageViewHeight);
    [self.view insertSubview:imageView atIndex:0];
    _topImageView=imageView;
}

#pragma mark 添加详细
-(void)AddMenuDetialView
{
    __weak MenuDetialViewController *weekMDVc=self;
    MenuDetialViewFrame *frame=[[MenuDetialViewFrame alloc] init];
    frame.menuDetial=_menuDetial;
    MenuDetialView *menuDetial=[[MenuDetialView alloc] init];
    menuDetial.menuDetialFrame=frame;
    //广告位
    menuDetial.adData=^(AdData *adData)
    {
        WebViewController *wvVc=[[WebViewController alloc] init];
        wvVc.webUrl=adData.url;
        wvVc.webTitle=adData.title;
        [weekMDVc.navigationController pushViewController:wvVc animated:YES];
    };
    
    //标签点击
    menuDetial.tagOpeartion=^(Tag *tag)
    {
        HomeCagetoryListViewController *hlVc= [[HomeCagetoryListViewController alloc] init];
        hlVc.name=tag.name;
        hlVc.tagId=tag.tagId;
        [weekMDVc.navigationController pushViewController:hlVc animated:YES];
    };
    
    //点击进入评论详情
    menuDetial.watchMoreOpeartion=^(NSInteger rid)
    {
        AllCommentViewController *avc=[[AllCommentViewController alloc] init];
        avc.rid=rid;
        [weekMDVc.navigationController pushViewController:avc animated:YES];
    };
    
    menuDetial.showUserInfoOpeartion=^(NSInteger userId,NSString *userName)
    {
        UserCookBookCenterViewController *usVc=[[UserCookBookCenterViewController alloc] init];
        usVc.userId=[NSString stringWithFormat:@"%ld",userId];
        usVc.userName=userName;
        [weekMDVc.navigationController pushViewController:usVc animated:YES];
    };
    
    menuDetial.frame=CGRectMake(0, kImageViewHeight, self.view.frame.size.width, [frame getMaxHeight]+kTabBarHeight+10);
    menuDetial.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:menuDetial];
    _scrollView.contentSize=CGSizeMake(0, kImageViewHeight+[frame getMaxHeight]+kTabBarHeight+10);
}

#pragma mark 工具条的点击事件处理
-(void)itemClick:(int)tag
{
    switch (tag) {
            //返回
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            //收藏
        case 1:
            
            break;
            //评论
        case 2:
        {
            AllCommentViewController *allcomVc=[[AllCommentViewController alloc] init];
            allcomVc.rid=_rid;
            [self.navigationController pushViewController:allcomVc animated:YES];
        }
            break;
        case 3:
        
            break;
            //分享
        case 4:
        {
            [self share];
        }
            break;
            //返回首页
        case 5:
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}

-(void)share
{
    UIImage *image=_topImageView.image;
    
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"seach_ditu_ios" ofType:@"jpg"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:_menuDetial.info.intro
                                       defaultContent:_menuDetial.info.intro
                                                image:[ShareSDK pngImageWithImage:image]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"好菜谱当然要分享"
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:self.view arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    [UIUtils showHudWithTitle:@"分享成功" success:YES];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    
                                    [UIUtils showHudWithTitle:@"分享失败,您的文字过长" success:NO];
                                }
                            }];

}

@end
