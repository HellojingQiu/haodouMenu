//
//  LatelyWatchController.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "LatelyWatchController.h"

@interface LatelyWatchController ()

@end

@implementation LatelyWatchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"最近浏览";
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}
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
