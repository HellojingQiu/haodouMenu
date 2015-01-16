//
//  ContainerView.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ContainerView.h"
#import "BottomModelFrame.h"
#import "Wiki.h"
#import "Collect.h"
#import "SubDetialView.h"

#define kMaragin 20

@interface ContainerView()
{
    UILabel *_title;
    UIView *_cellView;
    UIImageView *_lineImageView;
    UIView *_showMoreView;
    
    UILabel *_showMoreDetil;
    UIImageView *_showMoreArrows;
}
@end

@implementation ContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
        [self addSuItems];
    }
    return self;
}

#pragma mark 添加子控件
-(void)addSuItems
{
    //添加头部标题
    _title=[[UILabel alloc] init];
    _title.textColor=kGetColor(0.0980, 0.5490, 0.0980, 1);
    _title.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
    [self addSubview:_title];
    //添加中间的cell模块
    _cellView=[[UIView alloc] init];
    [self addSubview:_cellView];
    //添加分割线
    _lineImageView=[[UIImageView alloc] init];
    _lineImageView.image=kLineImage;
    [self addSubview:_lineImageView];
    //添加底部跳转
    _showMoreView=[[UIView alloc] init];
    [self addSubview:_showMoreView];
    
    _showMoreDetil=[[UILabel alloc] init];
    _showMoreDetil.frame=CGRectMake(0, 12, 200, 20);
    _showMoreDetil.font=[UIFont systemFontOfSize:15];
    [_showMoreView addSubview:_showMoreDetil];
    
    _showMoreArrows=[[UIImageView alloc] init];
    
    _showMoreArrows.image=[UIImage imageNamed:@"ico_more_arrow_right.png"];
    _showMoreArrows.frame=CGRectMake(270, 12, 20, 20);
    [_showMoreView addSubview:_showMoreArrows];
}

#pragma mark 重写设置frame
-(void)setBottomframe:(BottomModelFrame *)bottomframe
{
    _bottomframe=bottomframe;
    
    //title数据frmae设定
    _title.frame=bottomframe.titleFrame;
    
    //中间cell数据设定
    _cellView.frame=bottomframe.cellViewFrame;
    for (int i=0; i<bottomframe.dataArray.count; i++) {
        SubDetialView *subDetil=[SubDetialView initWithNib];
        subDetil.model=bottomframe.dataArray[i];
        subDetil.frame=CGRectMake(0, i*(80+kMaragin)*i, kScreenWidth, (80+kMaragin));
        subDetil.cellClick=^(id model)
        {
            _showDetial(bottomframe.dataArray[i]);
        };
        [_cellView addSubview:subDetil];
    }
    
    
    //分割线设定
    _lineImageView.frame=bottomframe.lineImageViewFrame;
    
    //最底部数据设定
    _showMoreView.frame=bottomframe.showMoreViewFrame;
    
    if (bottomframe.dataArray) {
        //厨房宝典
        if ([bottomframe.dataArray[0] isKindOfClass:[Wiki class]]) {
            _title.text=@"厨房宝典";
            _showMoreDetil.text=@"查看全部厨房宝典";
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(watchAllBook)];
            [_showMoreView addGestureRecognizer:tap];
        }
        //菜谱专辑
        else
        {
            _title.text=@"菜谱专辑";
            _showMoreDetil.text=@"查看全部菜谱";
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(watchAllMenu)];
            [_showMoreView addGestureRecognizer:tap];
        }
    }
    


}

#pragma mark 查看全部厨房宝典
-(void)watchAllBook
{
    if (_checkAllKitchenBook) {
        _checkAllKitchenBook();
    }
}

#pragma mark 查看菜谱专辑
-(void)watchAllMenu
{
    if (_checkAllMenu) {
        _checkAllMenu();
    }
}


@end
