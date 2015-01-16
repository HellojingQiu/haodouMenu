//
//  CategoryListViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CategoryListViewController.h"
#import "SearchTableViewCell.h"
#import "SearchCellArrows.h"
#import "Tag.h"
#import "HomeCagetoryListViewController.h"
@interface CategoryListViewController ()

@end

@implementation CategoryListViewController

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
    self.title=_cateTitle;
    
    [self dataLoadSuccess];
}

#pragma mark 数据加载成功 做数据处理
-(void)dataLoadSuccess
{
    NSMutableArray *dataArray=[NSMutableArray array];
    for (int i=0;i< _categoryItems.count; i++) {
        SearchCellArrows *baseModel=[[SearchCellArrows alloc]init];
        Tag *tag=_categoryItems[i];
        baseModel.title=tag.name;
        baseModel.arrowsType=ArrowsTypeRadius;
        baseModel.tagId=tag.tagId;
        [dataArray addObject:baseModel];
    }
    _dataArray=dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ide=@"searchCell";
    SearchTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    cell.baseCellModel=_dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCellModel *baseModel=_dataArray[indexPath.row];
    HomeCagetoryListViewController *homeListVc=[[HomeCagetoryListViewController alloc] init];
    homeListVc.name=baseModel.title;
    homeListVc.tagId=baseModel.tagId;
    
    [self.navigationController pushViewController:homeListVc animated:YES];
}

@end
