//
//  UserRecipeTableViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-8.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "UserRecipeTableViewController.h"
#import "MenuViewModel.h"
#import "MenuViewCell.h"
#import "MenuDetialViewController.h"
#import "AchievementPicModel.h"
@interface UserRecipeTableViewController ()<MenuViewCellDelegate>
{
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;
    
}
@end

@implementation UserRecipeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView=(UITableView *)self.view;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

#pragma mark 重写url设置 加载数据
-(void)setUrl:(NSString *)url
{
    _url=url;
    
    [self loadData];
}

#pragma mark 加载数据
-(void)loadData
{
    [UIUtils loadDataByUrl:_url success:^(id JsonData) {
        NSArray *dataList=JsonData[@"result"][@"list"];
        NSMutableArray *tempArray=[NSMutableArray array];
        NSMutableArray *subArray=[NSMutableArray array];
        int index=0;
        for (int i=0; i<dataList.count; i++) {
            MenuViewModel *model;
            if (_modelClass==[AchievementPicModel class]) {
                model=[AchievementPicModel initWithAchievementDic:dataList[i]];
            }
            else
            {
                model=[MenuViewModel initWithDic:dataList[i]];
            }
            
            [subArray addObject:model];
            if (index==1) {
                [tempArray addObject:subArray];
                index=0;
                subArray=[NSMutableArray array];
            }else
            {
                index++;
            }
            if (i==dataList.count-1&&subArray.count!=0) {
                [tempArray addObject:subArray];
                break;
            }
        }
        _dataArray=tempArray;
        
        [_tableView reloadData];
        
    } failed:^{
        
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *userRecipe=@"userCell";
    MenuViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userRecipe];
    
    if (cell==nil) {
        cell=[[MenuViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userRecipe];
    }
    
    cell.dataArray=_dataArray[indexPath.row];
    cell.delegate=self;
    
    return cell;
}

#pragma mark 单元格点击事件
-(void)menuViewCellClick:(MenuViewCell *)cell dataModel:(MenuViewModel *)model
{
    if (_opeartion) {
        _opeartion(model.title,model.rid);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

-(CGFloat)getMaxHeight
{
    return 180*_dataArray.count;
}

@end
