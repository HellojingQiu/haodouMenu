//
//  BaseViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "BaseViewController.h"



@interface BaseViewController ()<MJRefreshBaseViewDelegate>
{
    MJRefreshFooterView *_footer;
    MJRefreshHeaderView *_header;
    UITableView *_tableView;
    UIView *_tabbar;
    int offset;
}
@end

@implementation BaseViewController

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
    //子tabbar初始化
    [self initSubTabbar];
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-2*kTabBarHeight-14) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    [self addFootAndHeader];
    
    _dataArray=[NSArray array];
    _tableView.backgroundColor=kAllBgColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _outUserTableView=_tableView;
    offset=0;
    [self loadFirstData];
}
#pragma mark 第一次加载数据
-(void)loadFirstData
{
    [self loadData];
}

//添加上下刷新
-(void)addFootAndHeader
{
    _footer=[[MJRefreshFooterView alloc] init];
    _footer.scrollView=_tableView;
    _footer.delegate=self;
    _header=[[MJRefreshHeaderView alloc] init];
    _header.scrollView=_tableView;
    _header.delegate=self;

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

#pragma mark 初次加载数据
-(void)loadData
{
    [UIUtils showHudWithTitle:@"正在加载数据" view:_tableView];
    [UIUtils loadDataByUrl:_url success:^(id JsonData) {
        _json=JsonData;
        
        [self.delegate dataLoadSuccess];
        [_tableView reloadData];
        [UIUtils hiddenHudWithView:_tableView];
    } failed:^{
        [UIUtils hiddenHudWithView:_tableView];
    }];
}

#pragma mark 初次加载数据
-(void)loadData:(UIView *)view
{
    [UIUtils showHudWithTitle:@"正在加载数据" view:view];
    [UIUtils loadDataByUrl:_url success:^(id JsonData) {
        _json=JsonData;
        
        [self.delegate dataLoadSuccess];
        [_tableView reloadData];
        [UIUtils hiddenHudWithView:view];
    } failed:^{
        [UIUtils hiddenHudWithView:view];
    }];
}

#pragma mark 代理刷新
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    NSRange rang=[_url rangeOfString:@"offset="];
    NSRange newRang;
    if (rang.length==0) {
        newRang=NSMakeRange(0, 0);
    }else
    {
         newRang=NSMakeRange(rang.location, _url.length-rang.location);
    }
   
//    ILLog(@"%@",[_url stringByReplacingCharactersInRange:newRang withString:@"offset=40"] );
    //向下拉
    if (refreshView==_header) {
        offset=0;
        //向上了清空数据
        _dataArray=[NSMutableArray array];
        if (rang.length!=0) {
            _url=[_url stringByReplacingCharactersInRange:newRang withString:[NSString stringWithFormat:@"offset=%d",offset]];
        }
        [UIUtils loadDataByUrl:_url success:^(id JsonData) {
            _json=JsonData;

            [self.delegate dataLoadSuccess];
            [_tableView reloadData];
            [_header endRefreshing];
            offset+=20;
        } failed:^{
             [_header endRefreshing];
        }];
        
    }
    //向上拉
    else
    {
        
        if (rang.length!=0) {
            offset+=20;
            _url=[_url stringByReplacingCharactersInRange:newRang withString:[NSString stringWithFormat:@"offset=%d",offset]];
        }else
        {
            _dataArray=[NSMutableArray array];
            offset=0;
        }
        [UIUtils loadDataByUrl:_url success:^(id JsonData) {
            _json=JsonData;
            [self.delegate dataLoadSuccess];
            [_tableView reloadData];
            [_footer endRefreshing];
        } failed:^{
            [_footer endRefreshing];
        }];
    }
}

#pragma mark tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"baseCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)dealloc
{
    [_footer free];
    [_header free];
}

@end
