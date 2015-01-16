//
//  MenuViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuViewModel,MenuViewCell;
@protocol MenuViewCellDelegate <NSObject>

-(void)menuViewCellClick:(MenuViewCell *)cell dataModel:(MenuViewModel *)model;

@end

@interface MenuViewCell : UITableViewCell

@property (strong,nonatomic) NSArray *dataArray;

@property (assign,nonatomic) id<MenuViewCellDelegate> delegate;

@end
