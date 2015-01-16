    //
//  HomeViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//
//menu_ico_Camera.png晒一晒
//menu_ico_collect.png 排行榜
//menu_ico_publish.png 发布菜谱
//menu_ico_recipe.png 营养早餐

#import "HomeViewController.h"

#import "TopSlideView.h"
#import "Result.h"
#import "ItemsView.h"
#import "MenuCategoryItemsView.h"
#import "BottomModelFrame.h"
#import "ContainerView.h"
#import "Tag.h"
#import "HomeCagetoryListViewController.h"
#import "MenuDetialViewController.h"
#import "Recipe.h"
#import "NutritionTableViewController.h"
#import "MenuSpecialViewController.h"
#import "KitchenViewController.h"
#import "WebViewController.h"
#import "Wiki.h"
#import "Collect.h"
#import "MenuViewController.h"
#import "ReLoadView.h"
#import "RankListViewController.h"
#define kMenuCagetoryHeight 40
#define kMaragin 10

@interface HomeViewController ()<MJRefreshBaseViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    //网络请求返回数据
    Result *_result;
    //顶部的滑动模块
    TopSlideView *_top;
    //4个点击（排行榜....）
    ItemsView *_itemsView;
    //各个菜分类item
    MenuCategoryItemsView *_menuCategory;
    //主scrollView
    UIScrollView *_scrollView;
    //头部刷新
    MJRefreshHeaderView *_header;
    //PickImage
    UIImagePickerController *_pickController;
    
    ReLoadView *_reloadView;
}
@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"首页";
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}

-(void)loadView
{
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    self.view=scrollView;
    scrollView.frame=kScreenFrame;
    _header=[[MJRefreshHeaderView alloc] init];
    _header.scrollView=scrollView;
    _header.delegate=self;
    _scrollView=scrollView;
    _scrollView.showsVerticalScrollIndicator=NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //判断网络连接
    if ([UIUtils getNetWorkState]==NoNetWork) {
        _reloadView=[[ReLoadView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
        __weak HomeViewController *hv=self;
        _reloadView.reloadBlock=^
        {
            if ([UIUtils getNetWorkState]!=NoNetWork) {
                [hv startLoad];
            }
        };
        [self.view addSubview:_reloadView];
        //加载离线数据
        [self loadOfflineData];
        
        return;
    }
    [self startLoad];
}
#pragma mark 开始加载界面
-(void)startLoad
{
    [_reloadView removeFromSuperview];
    //添加顶部的滑动视图
    [self addTopSlideView];
    //开始刷新
    //    [_header beginRefreshing];
    [self loadData];
    
    _pickController=[[UIImagePickerController alloc] init];
    _pickController.delegate=self;
}

#pragma 上下拉刷新代理
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView==_header) {
        [self loadData];
    }
}

#pragma mark 加载所有的控件
-(void)initAllControl
{
    //添加排行榜 营养早餐 发布菜谱 晒一晒
    [self addItemsView];
    
    //添加菜谱分类点击
    [self addMenuCategory];
    
    //添加下部的厨房菜谱和厨房
    [self addBigCellData];
}

//添加排行榜 营养早餐 发布菜谱 晒一晒
-(void)addItemsView
{
    _itemsView=[[ItemsView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_top.frame), kScreenWidth, 80)];
    
    __weak HomeViewController *weekVc=self;
    
    //排行榜
    _itemsView.rankingListOperation=^
    {
        RankListViewController *rlVc=[[RankListViewController alloc] init];
        [weekVc.navigationController pushViewController:rlVc animated:YES];
    };
    //营养餐桌
    _itemsView.nutritionTableOpeartion=^
    {
        NutritionTableViewController *vc=[[NutritionTableViewController alloc] init];
        [weekVc.navigationController pushViewController:vc animated:YES];
    };
    
    //发布菜谱
    _itemsView.sendMenuOpeartion=^
    {

    };
    
    //晒一晒
    _itemsView.baskOpeartion=^
    {
        UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:nil delegate:weekVc cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"相册选取", nil];
        [actionSheet showInView:weekVc.view.window];
    };
    [self.view addSubview:_itemsView];
}

#pragma mark 加载数据
/**
 *  加载数据
 */
-(void)loadData
{
    [UIUtils showHudWithTitle:@"正在努力加载....." view:self.view];
    [UIUtils loadDataByUrl:kHOME_URL success:^(id JsonData) {
        NSDictionary *dic=JsonData;
        _result=[Result initWithDic:dic[@"result"]];
        _top.dataArray=_result.recipeList;
        //请求成功将数据存储用于离线时候看
        [UIUtils testData:kHOME_URL fileName:@"homeData.plist"];
        [self initAllControl];
        [_header endRefreshing];
        [UIUtils hiddenHudWithView:self.view];
    } failed:^{
        [_header endRefreshing];
        [UIUtils hiddenHudWithView:self.view];
    }];
    
}

#pragma mark 加载离线数据
-(void)loadOfflineData
{
    [self addTopSlideView];
    NSString *path=[UIUtils getDecumentPath:@"homeData.plist"];
    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:path];
    _result=[Result initWithDic:dic[@"result"]];
    _top.dataArray=_result.recipeList;
    [self initAllControl];
}

#pragma mark 顶部滑动模块添加
/**
 *  添加顶部的滑动
 */
-(void)addTopSlideView
{
    _top=[[TopSlideView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    __weak HomeViewController *weekVc=self;
    
    _top.topSlideView=^(Recipe *recipe)
    {
        MenuDetialViewController *menuVc=[[MenuDetialViewController alloc] init];
        menuVc.menuTitle=recipe.title;
        menuVc.rid=recipe.rid;
        [weekVc.navigationController pushViewController:menuVc animated:YES];
    };
    [self.view addSubview:_top];
    
}

#pragma mark 添加菜谱分类点击
-(void)addMenuCategory
{
    CGFloat height=(_result.tagList.count/4)*kMenuCagetoryHeight;
    _menuCategory=[[MenuCategoryItemsView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_itemsView.frame)+kMaragin, kScreenWidth, height)];
    _menuCategory.tagArray=_result.tagList;
    //跳转菜谱分类点击跳转
    __weak HomeViewController *weekHome=self;
    __weak Result *weekResult=_result;
    _menuCategory.categoryItemBtnBlock=^(int tag)
    {
        Tag *tagModel=weekResult.tagList[tag];
        //分类点击页面push
        HomeCagetoryListViewController *homeCagetoryList=[[HomeCagetoryListViewController alloc] init];
        homeCagetoryList.tagId=tagModel.tagId;
        homeCagetoryList.name=tagModel.name;
        [weekHome.navigationController pushViewController:homeCagetoryList animated:YES];
    };
    [self.view addSubview:_menuCategory];
}

#pragma mark 添加下面的菜谱 和厨房宝典
-(void)addBigCellData
{
    __weak HomeViewController *vc=self;
    BottomModelFrame *collectFrame=[[BottomModelFrame alloc] init];
    collectFrame.dataArray=_result.collectList;
    
    ContainerView *collectView=[[ContainerView alloc] init];
    collectView.checkAllMenu=^
    {
        MenuSpecialViewController *menuVc=[[MenuSpecialViewController alloc] init];
        [vc.navigationController pushViewController:menuVc animated:YES];
    };
    collectView.showDetial=^(id model)
    {
        Collect *collect=(Collect *)model;
        MenuViewController *mvc=[[MenuViewController alloc] init];
        mvc.mentTitle=collect.title;
        mvc.cid=collect.cid;
        [vc.navigationController pushViewController:mvc animated:YES];
    };
    collectView.bottomframe=collectFrame;
    collectView.frame=CGRectMake(0, CGRectGetMaxY(_menuCategory.frame)+kMaragin, kScreenWidth, [collectFrame getMaxHeight]);
    
    [self.view addSubview:collectView];
    
    BottomModelFrame *wikiFrame=[[BottomModelFrame alloc] init];
    wikiFrame.dataArray=_result.wikiList;
    ContainerView *wikiView=[[ContainerView alloc] init];
    wikiView.checkAllKitchenBook=^
    {
        KitchenViewController *kvVc=[[KitchenViewController alloc] init];
        [vc.navigationController pushViewController:kvVc animated:YES];
    };
    wikiView.bottomframe=wikiFrame;
    wikiView.showDetial=^(id model)
    {
        Wiki *wiki=(Wiki *)model;
        WebViewController *webVc=[[WebViewController alloc] init];
        webVc.webUrl=wiki.url;
        webVc.webTitle=wiki.title;
        [vc.navigationController pushViewController:webVc animated:YES];
    };
    wikiView.frame=CGRectMake(0, CGRectGetMaxY(collectView.frame)+kMaragin, kScreenWidth, [wikiFrame getMaxHeight]);
    
    [self.view addSubview:wikiView];
    
    _scrollView.contentSize=CGSizeMake(0, CGRectGetMaxY(wikiView.frame));
}

#pragma mark 晒一晒ActionSheet点击
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        [self openCamear];
    }
    else if(buttonIndex==1)
    {
        [self openPhoto];
    }
}

#pragma mark 打开相机
-(void)openCamear
{
    //判断是否有相机
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear])
    {
        _pickController.sourceType=UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_pickController animated:YES completion:nil];
    }else
    {
        [UIUtils showHudWithTitle:@"该设备相机不可用" success:NO];
    }
    
}

#pragma mark 打开相册
-(void)openPhoto
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        _pickController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_pickController animated:YES completion:nil];
    }else
    {
        [UIUtils showHudWithTitle:@"相册不可用" success:NO];
    }
}

#pragma mark 打开相册或者照相完毕后调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    ILLog(@"%@",info);
}

@end
