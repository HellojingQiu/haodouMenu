//
//  CommentTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "Comment.h"
#define kMarign 10

@interface CommentTableViewCell()
{
    UIImageView *_iconImage;
    UILabel *_comText;
    UILabel *_time;
}
@end

@implementation CommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addItems];
    }
    return self;
}

-(void)addItems
{
    _iconImage=[[UIImageView alloc] init];
    _iconImage.frame=CGRectMake(kMarign, kMarign, 40, 40);
    _iconImage.layer.cornerRadius=20;
    _iconImage.layer.masksToBounds=YES;
    _iconImage.backgroundColor=[UIColor clearColor];
    _iconImage.userInteractionEnabled=YES;
    
    _comText=[[UILabel alloc] init];
    _comText.frame=CGRectMake(CGRectGetMaxX(_iconImage.frame)+kMarign, kMarign*0.5,self.frame.size.width-3*kMarign-40 , (self.frame.size.height-kMarign));
    _comText.font=[UIFont systemFontOfSize:13];
    _comText.backgroundColor=[UIColor clearColor];
    _comText.numberOfLines=0;
    [self.contentView addSubview:_comText];
    
    _time=[[UILabel alloc] init];
    _time.font=[UIFont systemFontOfSize:12];
    _time.textColor=[UIColor darkGrayColor];
    _time.backgroundColor=[UIColor clearColor];
    _time.frame=CGRectMake(CGRectGetMaxX(_iconImage.frame)+kMarign, CGRectGetMaxY(_comText.frame),self.frame.size.width-3*kMarign-40, (self.frame.size.height-kMarign)/2);
    [self.contentView addSubview:_time];
    
    UIImageView *line=[[UIImageView alloc] init];
    line.image=kLineImage;
    line.frame=CGRectMake(kMarign, CGRectGetMaxY(_iconImage.frame)+kMarign-1, self.frame.size.width-kMarign, 1);
    [self.contentView addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setComment:(Comment *)comment
{
    _comment=comment;
    
    [_iconImage setImageWithURL:[NSURL URLWithString:comment.avatar] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
    //添加点击头像 查看详细信息
    UITapGestureRecognizer *userInfo=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showUserInfo:)];
    [_iconImage addGestureRecognizer:userInfo];
    [self.contentView addSubview:_iconImage];
    _comText.text=[NSString stringWithFormat:@"%@:%@",comment.userName,comment.content];
    
    _time.text=comment.createTime;
}

#pragma mark 查看用户详细信息
-(void)showUserInfo:(UITapGestureRecognizer *)tap
{
    if (_showUserInfoOpeartion) {
        _showUserInfoOpeartion(_comment.userId,_comment.userName);
    }
}

@end
