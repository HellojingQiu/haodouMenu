//
//  CommentTextFiled.h
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentTextFiled;
@protocol CommentTextFiledDelegate <NSObject>

//结束编辑
-(void)textFiledEndEdit:(CommentTextFiled *)commentTextFiled inputStr:(NSString *)inputStr;

@end

@interface CommentTextFiled : UIView<UITextFieldDelegate>

@property (assign,nonatomic) id<CommentTextFiledDelegate> delegate;

//开启编辑
-(void)isStartEdit:(BOOL)state;

@end
