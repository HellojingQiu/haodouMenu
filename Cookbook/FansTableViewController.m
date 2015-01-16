//
//  FansTableViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "FansTableViewController.h"
#import "FansInfo.h"
#import "FansTableViewCell.h"
@interface FansTableViewController ()
{
    NSMutableArray *_dataArray;
    
    UITableView *_tableView;
}
@end

@implementation FansTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArray=[NSMutableArray array];
    _tableView=(UITableView *)self.view;
    _tableView.rowHeight=60;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.scrollEnabled=NO;
}


-(void)setUrl:(NSString *)url
{
    _url=url;
    //加载数据
    [self loadData];
}

#pragma mark 加载数据
-(void)loadData
{
    [UIUtils loadDataByUrl:self.url success:^(id JsonData) {
       
        NSArray *dataArray=JsonData[@"result"][@"list"];
        NSMutableArray *tempArray=[NSMutableArray array];
        for (int i=0; i<dataArray.count; i++) {
            
            FansInfo *fans=[FansInfo initWithDic:dataArray[i]];
            [tempArray addObject:fans];
            if ((i+1)/4>0&&(i+1)%4==0) {
                [_dataArray addObject:tempArray];
                tempArray=[NSMutableArray array];
            }
            if (i==dataArray.count-1&&tempArray.count!=0) {
                [_dataArray addObject:tempArray];
                break;
            }
        }
        
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
    static NSString *ide=@"fanCell";
    FansTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[FansTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.dataArray=_dataArray[indexPath.row];
    cell.opeartion=^(NSInteger userId,NSString *userName)
    {
        _opeartionFans(userId,userName);
    };
    return cell;
}

-(CGFloat)getViewHeight
{
    return _dataArray.count*60;
}

@end
