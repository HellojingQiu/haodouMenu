//
//  MenuDetialViewFrame.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//
//菜谱名
//UILabel *_title;
//
////头像
//UIImageView *_avatar;
//
////用户名
//UILabel *_userName;
//
////发布时间
//UILabel *_reviewTime;
//
////描述
//UILabel *_intro;
//
////材料
//UIView *_stuffView;
//
////制作时间和用餐人数
//UIView *_cookTimeView;
//
////步骤文字查看更多
//UIView *_watchBigImageBtn;
//
////分割线
//UIImageView *_lineImage;
//
////步骤图
//UIView *_setpView;
//
////小贴士文本
//UILabel *_tipsLabel;
//
////小贴士下面分割线
//UIImageView *_tipsLine;
//
////小贴士详细
//UILabel *_tipsDetial;
//
////广告位
//UIView *_adDataView;
//
////评论标题
//UILabel *_commentLabel;
//
////评论分割线
//UIImageView *_commentLine;
//
////评论详情
//UIView *_commentView;
//
////查看更多评论
//UIView *_watchMoreBtn;
//
////相关标签
//UILabel *_tagLabel;
//
////相关标签
//UIView *_aboutTags;
//
////发布我的成果照
//UIButton *_sendMyPic;
//
////有疑问,私信作者
//UILabel *_lastLabel;

#import "MenuDetialViewFrame.h"
#import "MenuDetial.h"
#import "MenuIfo.h"
@implementation MenuDetialViewFrame

#define kMarign 10
#define kTitleTextHeight 20
#define kIconWidth 45
#define kIconHeight 45
#define kFontIntro [UIFont systemFontOfSize:15]
#define kFontTips [UIFont systemFontOfSize:14]
#define kCellHeight 44
#define kStepHeight 120
#define kAdData 50

#pragma mark 根据数据来计算每个控件的位置
-(void)setMenuDetial:(MenuDetial *)menuDetial
{
    _menuDetial=menuDetial;
    
    //菜谱名
    _titleFrame=CGRectMake(kMarign, kMarign, kScreenWidth-kMarign, kTitleTextHeight);
    
    //头像
    _avatarFrame=CGRectMake(kMarign, CGRectGetMaxY(_titleFrame)+kMarign, kIconWidth, kIconHeight);
    
    CGFloat userNameX=CGRectGetMaxX(_avatarFrame)+kMarign;
    
    //用户名
    _userNameFrame=CGRectMake(userNameX, CGRectGetMaxY(_titleFrame)+kMarign, kScreenWidth-kMarign-kIconWidth, kIconHeight/2);
    
    //发布时间
    _reviewTimeFrame=CGRectMake(userNameX, CGRectGetMaxY(_userNameFrame), kScreenWidth-kMarign-kIconWidth, kIconHeight/2);
    
   CGSize introSize= [UIUtils sizeOfStr:menuDetial.info.intro andFont:kFontIntro andMaxSize:CGSizeMake(kScreenWidth-2*kMarign, CGFLOAT_MAX) andLineBreakMode:NSLineBreakByWordWrapping];
    //描述
    _introFrame=CGRectMake(kMarign, CGRectGetMaxY(_avatarFrame)+kMarign, introSize.width, introSize.height);
    //材料
    //计算材料的行数
    int count;
    //偶数
    if (menuDetial.info.stuff.count%2==0) {
        count=menuDetial.info.stuff.count/2;
    }
    else
    {
        //奇数
        count=menuDetial.info.stuff.count/2+1;
    }
    _stuffViewFrame=CGRectMake(kMarign, CGRectGetMaxY(_introFrame)+kMarign, kScreenWidth-2*kMarign, count*(kTitleTextHeight+10));
    
    //制作时间和用餐人数
    _cookTimeViewFrame=CGRectMake(0, CGRectGetMaxY(_stuffViewFrame)+kMarign, kScreenWidth, kCellHeight);
    
    //步骤文字查看更多
    _watchBigImageBtnFrame=CGRectMake(kMarign, CGRectGetMaxY(_cookTimeViewFrame)+kMarign, kScreenWidth-kMarign, kCellHeight);
    
    //分割线
    _lineImageFrame=CGRectMake(kMarign, CGRectGetMaxY(_watchBigImageBtnFrame)+1, kScreenWidth-2*kMarign, 1);
    //步骤图
    _setpViewFrame=CGRectMake(kMarign, CGRectGetMaxY(_lineImageFrame)+kMarign, kScreenWidth, kStepHeight*(menuDetial.info.steps.count));

    //小贴士文本
    _tipsLabelFrame=CGRectMake(kMarign, CGRectGetMaxY(_setpViewFrame)+kMarign, kScreenWidth-kMarign*2, kCellHeight);
    
    //小贴士下面分割线
    _tipsLineFrame=CGRectMake(kMarign, CGRectGetMaxY(_tipsLabelFrame)+1, kScreenWidth-kMarign*2, 1);
    
    CGSize tipsSize= [UIUtils sizeOfStr:menuDetial.info.tips andFont:kFontTips andMaxSize:CGSizeMake(kScreenWidth-2*kMarign, CGFLOAT_MAX) andLineBreakMode:NSLineBreakByWordWrapping];
    
    //小贴士详细
    _tipsDetialFrame=CGRectMake(kMarign, CGRectGetMaxY(_tipsLineFrame)+kMarign, tipsSize.width, tipsSize.height);
    
    //有广告位
    if (menuDetial.adflag) {
        //添加广告广告位
        _adDataViewFrame=CGRectMake(kMarign, CGRectGetMaxY(_tipsDetialFrame)+kMarign, kScreenWidth-2*kMarign, kAdData);
        
        //评论标题
        _commentLabelFrame=CGRectMake(kMarign, CGRectGetMaxY(_adDataViewFrame)+kMarign, kScreenWidth-2*kMarign, kTitleTextHeight);
    }else
    {
        //没有广告位
        //评论标题 的位置根据小贴士来计算
        _commentLabelFrame=CGRectMake(kMarign, CGRectGetMaxY(_tipsDetialFrame)+kMarign, kScreenWidth-2*kMarign, kTitleTextHeight);
    }
    
    //评论分割线
    _commentLineFrame=CGRectMake(kMarign, CGRectGetMaxY(_commentLabelFrame)+kMarign, kScreenWidth-2*kMarign, 1);
    
    //评论详情
    _commentViewFrame=CGRectMake(0, CGRectGetMaxY(_commentLineFrame)+kMarign, kScreenWidth, kAdData*menuDetial.commentArray.count);
    
    //查看更多评论
    _watchMoreBtnFrame=CGRectMake(0, CGRectGetMaxY(_commentViewFrame)+kMarign, kScreenWidth, kCellHeight);
    
    //相关标签
    _tagLabelFrame=CGRectMake(kMarign, CGRectGetMaxY(_watchMoreBtnFrame)+kMarign, kScreenWidth-2*kMarign, kTitleTextHeight+10);
    
    //相关标签
    //相关标签的行数
    int tags=0;
    if (menuDetial.info.tags.count%4==0) {
        tags=menuDetial.info.tags.count/4;
    }else
    {
        tags=menuDetial.info.tags.count/4+1;
    }
    
    _aboutTagsFrame=CGRectMake(0, CGRectGetMaxY(_tagLabelFrame)+kMarign, kScreenWidth, tags*kAdData);
    
    //发布我的成果照
    _sendMyPicFrame=CGRectMake(kMarign, CGRectGetMaxY(_aboutTagsFrame)+kMarign, kScreenWidth-2*kMarign, kCellHeight);
    
    //有疑问,私信作者
    _lastLabelFrame=CGRectMake(kMarign, CGRectGetMaxY(_sendMyPicFrame)+kMarign, kScreenWidth-2*kMarign, kTitleTextHeight);
    
}

-(CGFloat)getMaxHeight
{
    return CGRectGetMaxY(_lastLabelFrame)+kMarign;
}

@end
