//
//  SearchTableView.h
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTableViewDelegate <NSObject>

-(void)searchDataByKeyWorld:(NSString *)keyWorld;

@end

@interface SearchTableView : UITableView<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (strong,nonatomic) NSArray *dataArray;
@property (assign,nonatomic) int count;

@property (assign,nonatomic) id<SearchTableViewDelegate> searchDelegate;

@end
