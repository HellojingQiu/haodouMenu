//
//  StrollSubView.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "StrollSubView.h"
#import "BottomModule.h"
#import "ImageButton.h"
#define kSpace 10
#define kSmallWidth (kScreenWidth-3*kSpace)/3
#define kSmallHeight (self.frame.size.height-2*kSpace)/2

@interface StrollSubView()
{
    ImageButton *_bigImage;
    
    ImageButton *_smallImage;
    
    CGFloat _currectY;
}
@end

@implementation StrollSubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self addSubItems];
        _currectY=kSpace;
    }
    return self;
}

#pragma mark 添加子控件
-(void)addSubItems
{
    _bigImage=[[ImageButton alloc] init];
    [self addSubview:_bigImage];
    
}

-(void)setIndex:(NSInteger)index
{
    _index=index;
    
    for (int i=0; i<_dataArray.count; i++) {
        BottomModule *model=_dataArray[i];
        //偶数大图在后
        if (_index==0) {
            
            //大图
            if (i==_dataArray.count-1) {
                _bigImage.frame=CGRectMake(CGRectGetMaxX(_smallImage.frame)+kSpace, kSpace, kSmallWidth*2, kSmallHeight*2);
                _bigImage.bottomModule=model;
                _bigImage.operation=_operation;
            }
            else//小图
            {
                _smallImage=[[ImageButton alloc] init];
                _smallImage.frame=CGRectMake(kSpace, _currectY, kSmallWidth, kSmallHeight-12);
                _smallImage.bottomModule=model;
                _smallImage.operation=_operation;
                [self addSubview:_smallImage];
                _currectY+=CGRectGetMaxY(_smallImage.frame);
                
            }
        }
        else//奇数大图在前
        {
            //大图
            if (i==0) {
                _bigImage.frame=CGRectMake(kSpace, kSpace, kSmallWidth*2, kSmallHeight*2);
                _bigImage.bottomModule=model;
                _bigImage.operation=_operation;
            }
            else//小图
            {
                _smallImage=[[ImageButton alloc] init];
                _smallImage.frame=CGRectMake(CGRectGetMaxX(_bigImage.frame)+kSpace, _currectY, kSmallWidth, kSmallHeight-12);
                _smallImage.bottomModule=model;
                _smallImage.operation=_operation;
                [self addSubview:_smallImage];
                _currectY+=CGRectGetMaxY(_smallImage.frame);

            }
        }
    }
    
   
}


@end
