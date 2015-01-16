//
//  MainViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//  主控制器

#import "MainViewController.h"
#import "CBTabBar.h"
#import "MineViewController.h"
#import "StrollViewController.h"
#import "CatrgoryViewController.h"
#import "SearchViewController.h"
#import "HomeViewController.h"

@interface MainViewController ()
{
    CBTabBar *_cbTabBar;
    CBTabBar *_cbSubControllerTabBar;
    UIViewController *_currectViewController;
    CGRect _currectFrame;
}
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _currectFrame=self.view.frame;
    // Do any additional setup after loading the view.
    //添加tabbar
    [self addTabBar];
    

    
    //添加子控制器
    [self addSubViewController];
    
    __weak MainViewController *navController=self;
    _cbTabBar.itemClickBlock=^(int tag)
    {
        [navController selectedControllor:tag];
    };
    
    [self selectedControllor:0];
    
}


#pragma mark 添加子控制器
-(void)addSubViewController
{
    //主页
    HomeViewController *home=[[HomeViewController alloc] init];
    [self addChildViewController:home];
    //搜索
    SearchViewController *search=[[SearchViewController alloc] init];
    [self addChildViewController:search];
    //分类
    CatrgoryViewController *catrgory=[[CatrgoryViewController alloc] init];
    [self addChildViewController:catrgory];
    //逛逛
    StrollViewController *stroll=[[StrollViewController alloc] init];
    [self addChildViewController:stroll];
    //个人中心
    MineViewController *mine=[[MineViewController alloc] init];
    [self addChildViewController:mine];
    
}

-(void)addChildViewController:(UIViewController *)childController
{
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:childController];
    nav.delegate=self;
    //设置子控制导航位置
    if ([childController isKindOfClass:[MineViewController class]]) {
        nav.navigationBar.translucent = YES;
    }else{
        nav.navigationBar.translucent = NO;
    }
    [super addChildViewController:nav];
}

#pragma mark 添加Tabbar(主控制器工具条)
-(void)addTabBar
{
    _cbTabBar=[[CBTabBar alloc] init];
    _cbTabBar.frame=CGRectMake(0, self.view.frame.size.height-kTabBarHeight, self.view.frame.size.width, kTabBarHeight);
    [self.view addSubview:_cbTabBar];
    //添加itemes
    [self addItems];
}

#pragma mark 添加子items
-(void)addItems
{
    [_cbTabBar addTabBarItemWithIcon:@"main_menu_icon_home.png" title:@"首页"];
    [_cbTabBar addTabBarItemWithIcon:@"main_ico_menu_search.png" title:@"搜索"];
    [_cbTabBar addTabBarItemWithIcon:@"main_ico_menu_category.png" title:@"分类"];
    [_cbTabBar addTabBarItemWithIcon:@"main_ico_menu_random.png" title:@"逛逛"];
    [_cbTabBar addTabBarItemWithIcon:@"main_ico_menu_center.png" title:@"豆窝"];
}

#pragma mark 选择控制器
-(void)selectedControllor:(int)tag
{
    
    if (_currectViewController==self.childViewControllers[tag]) return;
    [_currectViewController.view removeFromSuperview];
    UIViewController *viewControllor=self.childViewControllers[tag];
    viewControllor.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabBarHeight);
    [self.view addSubview:viewControllor.view];
    _currectViewController=viewControllor;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *rootViewController=navigationController.viewControllers[0];
    if (viewController==rootViewController) {
//        self.view.frame=_currectFrame;
        _cbTabBar.hidden=NO;
        self.view.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);

    }else
    {
//        _currectFrame=self.view.frame;
//        _cbTabBar.hidden=YES;
        self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+kTabBarHeight);

    }
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *rootViewController=navigationController.viewControllers[0];
    if (viewController!=rootViewController) {
        _cbTabBar.hidden=YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
