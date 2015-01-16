//
//  FansTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "FansTableViewCell.h"
#import "FansInfo.h"
#import "FansButton.h"

#define kFanTag 600

@implementation FansTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray=dataArray;
    
    CGFloat width=self.frame.size.width/4;
    for (int i=0; i<dataArray.count; i++) {
        FansButton *fansBtn=[[FansButton alloc] initWithFrame:CGRectMake(width*i, 0, width, 70)];
        fansBtn.fansInfo=dataArray[i];
        UITapGestureRecognizer *buttonClick=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnClick:)];
        fansBtn.tag=kFanTag+i;
        [fansBtn addGestureRecognizer:buttonClick];
        [self.contentView addSubview:fansBtn];
    }
    
}

#pragma mark 点击事件
-(void)btnClick:(UITapGestureRecognizer *)tap
{
    UIView *view=tap.view;
    FansInfo *fans=_dataArray[view.tag-kFanTag];
    if (_opeartion) {
        _opeartion(fans.userId,fans.userName);
    }
}

@end
