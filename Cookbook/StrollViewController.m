//
//  StrollViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "StrollViewController.h"
#import "SubItem.h"
#import "BottomModule.h"
#import "StrollSubView.h"
#import "WebViewController.h"
#import "KitchenViewController.h"
#import "AppRecommendViewController.h"
#import "OpinionFeedViewController.h"
#import "MenuSpecialViewController.h"
#import "NutritionTableViewController.h"
#import "CategoryListViewController.h"
#import "CategoryModel.h"
#import "MenuViewController.h"
#import "ReLoadView.h"

#define kCategoryNames @[@"厨房宝典",@"应用推荐",@"意见反馈",@"菜谱专辑",@"营养餐桌",@"食材百科"]
#define kCategoryIcons @[@"interfix_ico_recipe.png",@"interfix_ico_app@2x.png",@"interfix_ico_suggestion.png",@"interfix_ico_collect.png",@"interfix_ico_effect.png",@"interfix_ico_knowledge.png"]
//间距
#define kSpaceHeight 10
#define kTag 1000
//子控件的高度
#define kStrollSubViewHeight 221

@interface StrollViewController ()<MJRefreshBaseViewDelegate>
{
    MJRefreshHeaderView *_header;
    NSArray *_dataArray;
    UIScrollView *_scrollView;
    CategoryModel *_categoryModel;
    ReLoadView *_reloadView;
}
@end

@implementation StrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"逛逛";
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}

-(void)loadView
{
    _scrollView=[[UIScrollView alloc] init];
    _scrollView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    _header=[[MJRefreshHeaderView alloc] init];
    _header.delegate=self;
    _header.scrollView=_scrollView;
    self.view=_scrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //判断网络连接
    if ([UIUtils getNetWorkState]==NoNetWork) {
        _reloadView=[[ReLoadView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
        __weak StrollViewController *hv=self;
        _reloadView.reloadBlock=^
        {
            if ([UIUtils getNetWorkState]!=NoNetWork) {
                [hv loadData];
            }
        };

        [self.view addSubview:_reloadView];
        [self loadOffLineData];
        return;
    }
    
    //加载数据
    [self loadData];
    
//    [UIUtils testData:kRandonCategory_URL];
}

#pragma mark 加载数据
-(void)loadData
{
    [UIUtils loadDataByUrl:KRandon_URL success:^(id JsonData) {
        
        NSArray *array=JsonData[@"result"][@"list"];
        NSMutableArray *tempArray=[NSMutableArray array];
        for (int i=0; i<array.count; i++) {
            BottomModule *bottomModel=[BottomModule initWithDic:array[i]];
            [tempArray addObject:bottomModel];
        }
        _dataArray=tempArray;
        [self loadFoodEncyData];
        [UIUtils testData:KRandon_URL fileName:@"StrollView.plist"];
        [_header endRefreshing];
        
    } failed:^{
        [_header endRefreshing];
    }];
}

#pragma mark 加载离线数据
-(void)loadOffLineData
{
    NSString *path=[UIUtils getDecumentPath:@"StrollView.plist"];
    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *array=dic[@"result"][@"list"];
    NSMutableArray *tempArray=[NSMutableArray array];
    for (int i=0; i<array.count; i++) {
        BottomModule *bottomModel=[BottomModule initWithDic:array[i]];
        [tempArray addObject:bottomModel];
    }
    _dataArray=tempArray;
    [self loadOfflineFoodEncyData];
}

#pragma mark加载食材百科
-(void)loadFoodEncyData
{
    [UIUtils loadDataByUrl:kRandonCategory_URL success:^(id JsonData) {
        
        NSDictionary *dic=JsonData[@"result"][@"list"][1];
        _categoryModel=[CategoryModel initWithDic:dic];
        
        //初始化控件
        [self initSubView];
        [UIUtils testData:KRandon_URL fileName:@"categoryModel.plist"];
    } failed:^{
        
    }];
}

#pragma mark加载食材百科
-(void)loadOfflineFoodEncyData
{
    NSString *path=[UIUtils getDecumentPath:@"categoryModel.plist"];
    NSDictionary *dicData=[NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dic=dicData[@"result"][@"list"][1];
    _categoryModel=[CategoryModel initWithDic:dic];
    [self initSubView];
}

#pragma mark 初始化控件
-(void)initSubView
{
    //添加顶部的分类点击
    [self addCategory];
    
    //添加下面的子View
    [self addSubStrollView];
}

#pragma mark 添加分类
-(void)addCategory
{
    CGFloat width=self.view.frame.size.width/3;
    
    int index=0;
    for (int i=0; i<2; i++) {
        for (int j=0; j<3; j++) {
            SubItem *subItem=[[SubItem alloc] initWithFrame:CGRectMake(j*width, i*width, width, width)];
            [subItem setTitle:kCategoryNames[index] forState:UIControlStateNormal];
            [subItem setImage:[UIImage imageNamed:kCategoryIcons[index]] forState:UIControlStateNormal];
            [subItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            subItem.titleLabel.font=[UIFont systemFontOfSize:14];
            subItem.backgroundColor=[UIColor whiteColor];
            subItem.tag=kTag+index;
            [subItem addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            index++;
            [self.view addSubview:subItem];
            //添加中线
            if (i==1) {
                UIImageView *line=[[UIImageView alloc] init];
                UIImage *lineImage= kLineImage;
                line.image=[lineImage stretchableImageWithLeftCapWidth:2 topCapHeight:2];
                line.frame=CGRectMake(0, width*i, kScreenWidth, 1);
                [self.view addSubview:line];
            }
        }
    }
    //画渐变线
    for (int j=1; j<3; j++) {
        UIImageView *shadeLine=[[UIImageView alloc] initWithFrame:CGRectMake(width*j, 0, 1, 2*width)];
        shadeLine.image=kLineImage;
        shadeLine.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:shadeLine];
    }
}

#pragma mark 下拉刷新
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView==_header) {
        [self loadData];
    }
}

#pragma mark 添加下面的子View
-(void)addSubStrollView
{
    NSMutableArray *tempArray=[NSMutableArray array];
    for (int i=0; i<_dataArray.count; i++) {
        [tempArray addObject:_dataArray[i]];
        if ((i+1)/3>0&&(i+1)%3==0) {
            StrollSubView *strollSubView=[[StrollSubView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.width/3)*2+((i+1)/3-1)*(kStrollSubViewHeight+kSpaceHeight)+kSpaceHeight, kScreenWidth, kStrollSubViewHeight)];
            
            __weak StrollViewController *weekStrollVc=self;
            //点击事件 控制器push
            strollSubView.operation=^(BottomModule *modelData)
            {
                //跳转网站控制器
                if (modelData.type==1) {
                    WebViewController *webVc=[[WebViewController alloc] init];
                    webVc.webUrl=modelData.url;
                    webVc.webTitle=modelData.title;
                    
                    [weekStrollVc.navigationController pushViewController:webVc animated:YES];
                }
                else//跳转其他控制器
                {
                    MenuViewController *mvc=[[MenuViewController alloc] init];
                    mvc.mentTitle=modelData.title;
                    mvc.cid=[modelData.url integerValue];
                    [weekStrollVc.navigationController pushViewController:mvc animated:YES];
                }
            };
            
            strollSubView.dataArray=tempArray;
            //设置大图在前还是大图在最后
            strollSubView.index=((i+1)/3)%2;
           
            [self.view addSubview:strollSubView];
            tempArray=[NSMutableArray array];
            
            if (i==_dataArray.count-1) {
                _scrollView.contentSize=CGSizeMake(0, CGRectGetMaxY(strollSubView.frame)+kSpaceHeight);
            }
        }
    }
}

#pragma mark 每一个类别点击事件
-(void)btnClick:(UIButton *)btn
{
    switch (btn.tag-1000) {
        //厨房宝典
        case 0:
        {
            KitchenViewController *vc=[[KitchenViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        //应用推荐
        case 1:
        {
            AppRecommendViewController *vc=[[AppRecommendViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        //意见反馈
        case 2:
        {
            OpinionFeedViewController *vc=[[OpinionFeedViewController alloc] init];
            UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vc];
            [self.navigationController presentViewController:nav animated:YES completion:nil];
        }
            break;
        //菜谱专辑
        case 3:
        {
            MenuSpecialViewController *vc=[[MenuSpecialViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        //营养餐桌
        case 4:
        {
            NutritionTableViewController *vc=[[NutritionTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        //食材百科
        case 5:
        {
            CategoryListViewController *vc=[[CategoryListViewController alloc] init];
            vc.cateTitle=@"食材百科";
            vc.categoryItems=_categoryModel.tags;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
