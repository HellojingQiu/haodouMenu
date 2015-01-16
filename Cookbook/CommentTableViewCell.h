//
//  CommentTableViewCell.h
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Comment;
@interface CommentTableViewCell : UITableViewCell

@property (strong,nonatomic) Comment *comment;

@property (copy,nonatomic) void(^showUserInfoOpeartion)(NSInteger userId,NSString *userName);

@end
