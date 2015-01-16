//
//  AllCommentViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AllCommentViewController.h"
#import "CommentTextFiled.h"
#import "CommentTableViewCell.h"
#import "Comment.h"
#import "UserCookBookCenterViewController.h"
#define kCommet_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1405150082&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Comment.getList&"
#define kParm_Url @"rid=%d&type=0&offset=0&limit=20"
#define kMyComment_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1405157180&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Comment.addComment"
@interface AllCommentViewController ()<CommentTextFiledDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIView *_tabbar;
    UIButton *_commentText;
    CommentTextFiled *_comment;
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation AllCommentViewController

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
    self.title=@"评论详情";
    self.view.backgroundColor=kAllBgColor;
    _dataArray=[NSMutableArray array];
    _tableView=[[UITableView alloc] init];
    //添加标签栏
    [self initSubTabbar];
    _tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, CGRectGetMaxY(_tabbar.frame)-kTabBarHeight);
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    UITapGestureRecognizer *tableViewTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableviewClick:)];
    [_tableView addGestureRecognizer:tableViewTap];
    [_tableView setRowHeight:60];
    //添加tableVew
    [self.view addSubview:_tableView];
    //添加评论条
    [self addComment];
    //注册键盘通知
    [self registerForKeyboardNotifications];
    
    //加载数据
    [self loadData];
}

#pragma mark 加载数据
-(void)loadData
{
    NSString *urlParm=[NSString stringWithFormat:kParm_Url,self.rid];
    NSString *url=[NSString stringWithFormat:@"%@%@",kCommet_URL,urlParm];
    
    [UIUtils loadDataByUrl:url success:^(id JsonData) {
       
        NSArray *tempArray=JsonData[@"result"][@"list"];
        for (int i=0; i<tempArray.count; i++) {
            Comment *comment=[Comment initWithDic:tempArray[i]];
            [_dataArray addObject:comment];
        }
        [_tableView reloadData];
        
    } failed:^{
        
    }];
    
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
    
    _commentText=[UIButton buttonWithType:UIButtonTypeCustom];
    _commentText.frame=CGRectMake(CGRectGetMaxX(backBtn.frame), kTabbarSpace/2, kScreenWidth-2*kBtnWidth-2*kTabbarSpace, kTabBarHeight-kTabbarSpace);
    [_commentText setTitle:@"我也来说两句" forState:UIControlStateNormal];
    [_commentText setTitleColor:kGetColor(0.4902, 0.6353, 0.1686, 1) forState:UIControlStateNormal];
    _commentText.titleLabel.font=[UIFont systemFontOfSize:14];
    _commentText.layer.borderWidth=1;
    _commentText.layer.cornerRadius=4;
    _commentText.layer.borderColor=[UIColor lightGrayColor].CGColor;

    [_commentText addTarget:self action:@selector(saySomeThing) forControlEvents:UIControlEventTouchDown];
    [_tabbar addSubview:_commentText];
    
    //返回主controller
    UIButton *backHome= [UIButton buttonWithType:UIButtonTypeCustom];
    [backHome setImage:[UIImage imageNamed:kBackHomeImage] forState:UIControlStateNormal];
    backHome.frame=CGRectMake(self.view.frame.size.width-kBtnWidth-kTabbarSpace, 0, kBtnWidth, kTabBarHeight);
    backHome.tag=11;
    [backHome addTarget:self action:@selector(btnBackClick:) forControlEvents:UIControlEventTouchDown];
    [_tabbar addSubview:backHome];
    [self.view addSubview:_tabbar];
}

#pragma mark 添加评论条
-(void)addComment
{
    _comment=[[CommentTextFiled alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tabbar.frame), kScreenWidth, kTabBarHeight)];
    _comment.delegate=self;
    [self.view addSubview:_comment];
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

-(void)tableviewClick:(UITapGestureRecognizer *)tap
{
    [_comment isStartEdit:NO];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_comment isStartEdit:NO];
}
#pragma mark 说点什么
-(void)saySomeThing
{
    [_comment isStartEdit:YES];
}

#pragma mark 实现代理
-(void)textFiledEndEdit:(CommentTextFiled *)commentTextFiled inputStr:(NSString *)inputStr
{
    
}

#pragma mark tableView数据代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"commentCell";
    
    CommentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    cell.comment=_dataArray[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    __weak AllCommentViewController *weekAll=self;
    cell.showUserInfoOpeartion=^(NSInteger userId,NSString *userName)
    {
        UserCookBookCenterViewController *ucVc=[[UserCookBookCenterViewController alloc] init];
        ucVc.userName=userName;
        ucVc.userId=[NSString stringWithFormat:@"%d",userId];
        [weekAll.navigationController pushViewController:ucVc animated:YES];
    };
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
   [_comment isStartEdit:NO];
}

#pragma mark 注册键盘通知
- (void)registerForKeyboardNotifications
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark 键盘显示通知
- (void)keyboardWasShown:(NSNotification *)notif
{
    NSDictionary *userInfo = [notif userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSNumber *duration = [userInfo  objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber  *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;
        [UIView  animateWithDuration:duration.doubleValue animations:^{
            [UIView setAnimationBeginsFromCurrentState:YES];
            [UIView setAnimationCurve:[curve intValue]];
    _comment.center = CGPointMake(_comment.center.x,
                              keyBoardEndY - 65 - _comment.bounds.size.height/2.0);
       }];
}
#pragma mark 键盘收起通知
- (void) keyboardWasHidden:(NSNotification *) notif
{
    NSDictionary *userInfo = [notif userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;
    // 得到键盘弹出后的键 盘视图所在y坐标
    NSNumber *duration = [userInfo  objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber  *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    // 添加移动动画，使视图跟随键盘移动
    [UIView  animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        _comment.center = CGPointMake(_comment.center.x,
                                  keyBoardEndY + 65 - _comment.bounds.size.height/2.0);
    }];
}

@end
