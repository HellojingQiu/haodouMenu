//
//  SearchCellArrows.h
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "BaseCellModel.h"

typedef enum
{
    ArrowsTypeMoreArrow,
    ArrowsTypeRadius
    
} ArrowsType;

@interface SearchCellArrows : BaseCellModel

@property (assign,nonatomic) ArrowsType arrowsType;
@property (copy,nonatomic) void(^cellOperation)();
@property (copy,nonatomic) NSString *className;

@end
