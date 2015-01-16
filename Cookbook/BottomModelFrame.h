//
//  BottomModelFrame.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BottomModelFrame : NSObject

@property (strong,nonatomic) NSArray *dataArray;

@property (assign,nonatomic) CGRect titleFrame;
@property (assign,nonatomic) CGRect cellViewFrame;
@property (assign,nonatomic) CGRect lineImageViewFrame;
@property (assign,nonatomic) CGRect showMoreViewFrame;

-(CGFloat)getMaxHeight;

@end
