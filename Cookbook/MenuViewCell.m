//
//  MenuViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuViewCell.h"
#import "SubView.h"
#import "MenuViewModel.h"
@interface MenuViewCell()<SubViewDelegate>
{
    SubView *_buttonleft;
    
    SubView *_buttonRight;
}
@end

@implementation MenuViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addItems];
        self.backgroundColor=kAllBgColor;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark 添加子控件
-(void)addItems
{
    CGFloat width= self.frame.size.width/2;
    _buttonleft=[[SubView alloc] initWithFrame:CGRectMake(0, 0, width, 180)];
    _buttonleft.delegate=self;
    [self.contentView addSubview:_buttonleft];
    
    _buttonRight=[[SubView alloc] initWithFrame:CGRectMake(width+2, 0, width, 180)];
    _buttonRight.delegate=self;
    [self.contentView addSubview:_buttonRight];

}

-(void)setFrame:(CGRect)frame
{
    CGRect newFrame=frame;
    newFrame.size.height-=10;
    [super setFrame:frame];
}

-(void)setDataArray:(NSArray *)dataArray
{
    
    _dataArray=dataArray;
    if (dataArray.count>0) {
        MenuViewModel *menu=dataArray[0];
        _buttonleft.menuModel=menu;
        
        if(dataArray.count==2)
        {
            MenuViewModel *menu1=dataArray[1];
            _buttonRight.menuModel=menu1;
            
        }
    }
   
   
    
}

-(void)subViewClick:(SubView *)subView model:(MenuViewModel *)model
{
    [self.delegate menuViewCellClick:self dataModel:model];
}

@end
