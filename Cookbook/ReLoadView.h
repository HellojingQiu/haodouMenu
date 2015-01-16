//
//  ReLoadView.h
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReLoadView : UIView

@property (copy,nonatomic) void(^reloadBlock)();

@end
