//
//  BottomModelFrame.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//  计算frame

#import "BottomModelFrame.h"

#define kMaragin 20
#define kTitleHeight 20
#define kSubDetialViewHeight 80
#define kLineImageHeight 1
#define kBottomViewHeight 44

@implementation BottomModelFrame

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray=dataArray;
    
    [self adjustFrame];
}

#pragma mark 根据数据计算frame
-(void)adjustFrame
{
    //头部标题的frame
    _titleFrame=CGRectMake(kMaragin, kMaragin, kScreenWidth, kTitleHeight);
    
    //cellView的frame
    _cellViewFrame=CGRectMake(0, CGRectGetMaxY(_titleFrame)+kMaragin, kScreenWidth, (kSubDetialViewHeight+kMaragin)*_dataArray.count);
    
    //计算分割线的frame
    _lineImageViewFrame=CGRectMake(kMaragin, CGRectGetMaxY(_cellViewFrame), kScreenWidth-20, kLineImageHeight);
    
    //计算最底部
    _showMoreViewFrame=CGRectMake(kMaragin, CGRectGetMaxY(_lineImageViewFrame), kScreenWidth, kBottomViewHeight);
}

#pragma mark 得到当前view的高度
-(CGFloat)getMaxHeight
{
    return CGRectGetMaxY(_showMoreViewFrame);
}

@end
