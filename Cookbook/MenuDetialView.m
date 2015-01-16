//
//  MenuDetialView.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuDetialView.h"
#import "MenuDetialViewFrame.h"
#import "MenuDetial.h"
#import "AdData.h"
#import "Comment.h"
#import "MenuIfo.h"
#import "Steps.h"
#import "Tag.h"
#import "StuffDetial.h"
#import "TagButton.h"
#define kTextColor kGetColor(0.4902, 0.6353, 0.1686, 1);
#define kFontIntro [UIFont systemFontOfSize:15]
#define kFontTips [UIFont systemFontOfSize:14]
#define kTitleTextHeight 20
#define kMarign 10
#define kIconImageTag 300
@interface MenuDetialView()
{
    //菜谱名
    UILabel *_title;
    
    //头像
    UIImageView *_avatar;
    
    //用户名
    UILabel *_userName;
    
    //发布时间
    UILabel *_reviewTime;
    
    //描述
    UILabel *_intro;
    
    //材料
    UIView *_stuffView;
    
    //制作时间和用餐人数
    UIView *_cookTimeView;
    
    //步骤文字查看更多
    UIView *_watchBigImageBtn;
    
    //分割线
    UIImageView *_lineImage;
    
    //步骤图
    UIView *_setpView;
    
    //小贴士文本
    UILabel *_tipsLabel;
    
    //小贴士下面分割线
    UIImageView *_tipsLine;
    
    //小贴士详细
    UILabel *_tipsDetial;
    
    //广告位
    UIImageView *_adDataView;
    
    //评论标题
    UILabel *_commentLabel;
    
    //评论分割线
    UIImageView *_commentLine;
    
    //评论详情
    UIView *_commentView;
    
    //查看更多评论
    UIView *_watchMoreBtn;
    
    //相关标签
    UILabel *_tagLabel;
    
    //相关标签
    UIView *_aboutTags;
    
    //发布我的成果照
    UIButton *_sendMyPic;
    
    //有疑问,私信作者
    UILabel *_lastLabel;
}
@end

@implementation MenuDetialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addItems];
        
    }
    return self;
}

#pragma mark 添加子控件
-(void)addItems
{
    //菜谱名
    _title=[[UILabel alloc] init];
    _title.textColor=kTextColor;
    _title.font=[UIFont systemFontOfSize:20];
    [self addSubview:_title];
    
    //头像
    _avatar=[[UIImageView alloc] init];
    _avatar.layer.cornerRadius=22;
    _avatar.layer.masksToBounds=YES;
    [self addSubview:_avatar];
    
    //用户名
    _userName=[[UILabel alloc] init];
    _userName.font=[UIFont systemFontOfSize:14];
    _userName.textColor=[UIColor darkGrayColor];
    [self addSubview:_userName];
    
    //发布时间
    _reviewTime=[[UILabel alloc] init];
    _reviewTime.font=[UIFont systemFontOfSize:14];
    _reviewTime.textColor=[UIColor darkGrayColor];
    [self addSubview:_reviewTime];
    
    //描述
    _intro=[[UILabel alloc] init];
    _intro.numberOfLines=0;
    _intro.font=kFontIntro;
    [self addSubview:_intro];
    
    //材料
    _stuffView=[[UIView alloc] init];
    [self addSubview:_stuffView];
    
    //制作时间和用餐人数
    _cookTimeView=[[UIView alloc] init];
    _cookTimeView.backgroundColor=kAllBgColor;
    [self addSubview:_cookTimeView];
    
    //步骤文字查看更多
    _watchBigImageBtn=[[UIView alloc] init];
    [self addSubview:_watchBigImageBtn];
    
    //分割线
    _lineImage=[[UIImageView alloc] init];
    _lineImage.image=kLineImage;
    [self addSubview:_lineImage];
    
    //步骤图
    _setpView=[[UIView alloc] init];
    [self addSubview:_setpView];
    
    //小贴士文本
    _tipsLabel=[[UILabel alloc] init];
    _tipsLabel.text=@"小贴士";
    _tipsLabel.font=[UIFont systemFontOfSize:18];
    [self addSubview:_tipsLabel];
    
    //小贴士下面分割线
    _tipsLine=[[UIImageView alloc] init];
    _tipsLine.image=kLineImage;
    [self addSubview:_tipsLine];
    
    //小贴士详细
    _tipsDetial=[[UILabel alloc] init];
    _tipsDetial.numberOfLines=0;
    _tipsDetial.font=kFontTips;
    [self addSubview:_tipsDetial];
    
    //广告位
    _adDataView=[[UIImageView alloc] init];
    [self addSubview:_adDataView];
    
    //评论标题
    _commentLabel=[[UILabel alloc] init];
    _commentLabel.text=@"评论";
    _commentLabel.font=[UIFont systemFontOfSize:18];
    [self addSubview:_commentLabel];
    
    //评论分割线
    _commentLine=[[UIImageView alloc] init];
    _commentLine.image=kLineImage;
    [self addSubview:_commentLine];
    
    //评论详情
    _commentView=[[UIView alloc] init];
    [self addSubview:_commentView];
    
    //查看更多评论
    _watchMoreBtn=[[UIView alloc] init];
    [self addSubview:_watchMoreBtn];
    
    //相关标签
    _tagLabel=[[UILabel alloc] init];
    _tagLabel.text=@"相关标签";
    _tagLabel.font=[UIFont systemFontOfSize:19];
    [self addSubview:_tagLabel];
    
    //相关标签
    _aboutTags=[[UIView alloc] init];
    [self addSubview:_aboutTags];
    
    //发布我的成果照
    _sendMyPic=[UIButton buttonWithType:UIButtonTypeCustom];
    _sendMyPic.backgroundColor=kGetColor(0.4706, 0.6745, 0.0000, 1);
    [_sendMyPic setTitle:@"发布我的成果照" forState:UIControlStateNormal];
    [self addSubview:_sendMyPic];
    
    //有疑问,私信作者
    _lastLabel=[[UILabel alloc] init];
    _lastLabel.text=@"有疑问？私信作者";
    _lastLabel.font=[UIFont systemFontOfSize:18];
    [self addSubview:_lastLabel];
}

#pragma mark 设置每个控件的位置
-(void)setMenuDetialFrame:(MenuDetialViewFrame *)menuDetialFrame
{
    _menuDetialFrame=menuDetialFrame;
    
    MenuIfo *info=menuDetialFrame.menuDetial.info;
    
    //菜谱名
    _title.frame=menuDetialFrame.titleFrame;
    _title.text=menuDetialFrame.menuDetial.info.title;
    //头像
    _avatar.frame=menuDetialFrame.avatarFrame;
    _avatar.userInteractionEnabled=YES;
    [_avatar setImageWithURL:[NSURL URLWithString:info.avatar] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
    UITapGestureRecognizer *avatarTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarClick:)];
    [_avatar addGestureRecognizer:avatarTap];
    
    //用户名
    _userName.frame=menuDetialFrame.userNameFrame;
    _userName.text=info.userName;
    //发布时间
    _reviewTime.frame=menuDetialFrame.reviewTimeFrame;
    _reviewTime.text=[NSString stringWithFormat:@"首发于:%@",info.reviewTime];
    //描述
    _intro.frame=menuDetialFrame.introFrame;
    _intro.text=info.intro;
    //材料
    _stuffView.frame=menuDetialFrame.stuffViewFrame;
    
    //添加详细的材料
    [self addSubStuff:info.stuff];
    
    //制作时间和用餐人数
    _cookTimeView.frame=menuDetialFrame.cookTimeViewFrame;
    
    [self addSubCookTime:info.cookTime userPeople:info.userCount];
    
    //步骤文字查看更多
    _watchBigImageBtn.frame=menuDetialFrame.watchBigImageBtnFrame;
    
    [self addWatchMore];
    
    //分割线
    _lineImage.frame=menuDetialFrame.lineImageFrame;
    
    //步骤图
    _setpView.frame=menuDetialFrame.setpViewFrame;
    
    [self addSubSteps:menuDetialFrame.menuDetial.info.steps];
    
    //小贴士文本
    _tipsLabel.frame=menuDetialFrame.tipsLabelFrame;
    
    //小贴士下面分割线
    _tipsLine.frame=menuDetialFrame.tipsLineFrame;
    
    //小贴士详细
    _tipsDetial.frame=menuDetialFrame.tipsDetialFrame;
    _tipsDetial.text=info.tips;
    
    //广告位
    _adDataView.frame=menuDetialFrame.adDataViewFrame;
    [_adDataView setImageWithURL:[NSURL URLWithString:menuDetialFrame.menuDetial.adData.image] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _adDataView.userInteractionEnabled=YES;
    //添加广告位的点击事件
    UITapGestureRecognizer *adDataTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showData)];
    [_adDataView addGestureRecognizer:adDataTap];
    
    //评论标题
    _commentLabel.frame=menuDetialFrame.commentLabelFrame;
    
    //评论分割线
    _commentLine.frame=menuDetialFrame.commentLineFrame;
    
    //评论详情
    _commentView.frame=menuDetialFrame.commentViewFrame;
    
    [self addCommentItems:menuDetialFrame.menuDetial.commentArray];
    
    //查看更多评论
    _watchMoreBtn.frame=menuDetialFrame.watchMoreBtnFrame;
    UITapGestureRecognizer *watchMoreTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(watchMoreClick)];
    [_watchMoreBtn addGestureRecognizer:watchMoreTap];
    [self addWatchMoreCom];
    
    //相关标签
    _tagLabel.frame=menuDetialFrame.tagLabelFrame;
    
    //相关标签
    _aboutTags.frame=menuDetialFrame.aboutTagsFrame;
    
    [self addTags:menuDetialFrame.menuDetial.info.tags];
    
    //发布我的成果照
    _sendMyPic.frame=menuDetialFrame.sendMyPicFrame;
    
    //有疑问,私信作者
    _lastLabel.frame=menuDetialFrame.lastLabelFrame;
}

#pragma mark 添加详细材料
-(void)addSubStuff:(NSArray *)stuff
{
    CGFloat width=_stuffView.frame.size.width/2;
    int rol;
    if (stuff.count%2==0) {
        rol=stuff.count/2;
    }else
    {
        rol=stuff.count/2+1;
    }
    CGFloat height=_stuffView.frame.size.height/rol;
    for (int i=0; i<stuff.count; i++) {
        StuffDetial *sd=stuff[i];
        CGFloat x=i%2*width;
        CGFloat y=i/2*height;
        
        UIView *tempView=[[UIView alloc] initWithFrame:CGRectMake(x, y+kMarign, width, height)];
         [_stuffView addSubview:tempView];
        
        UILabel *cate=[[UILabel alloc] init];
        cate.text=sd.cate;
        cate.textAlignment=NSTextAlignmentLeft;
        cate.frame=CGRectMake(0, 0, width/2, height);
        cate.font=[UIFont systemFontOfSize:14];
        cate.textColor=[UIColor darkGrayColor];
        [tempView addSubview:cate];
        
        UILabel *weight=[[UILabel alloc] init];
        weight.text=sd.weight;
        weight.textAlignment=NSTextAlignmentRight;
        weight.frame=CGRectMake( width/2-5, 0, width/2-5, height);
        weight.font=[UIFont systemFontOfSize:14];
        weight.textColor=[UIColor darkGrayColor];
        [tempView addSubview:weight];
    }
}

#pragma mark 制作时间和用餐人数
-(void)addSubCookTime:(NSString *)cookTime userPeople:(NSString *)userPeople
{
    CGFloat width=_cookTimeView.frame.size.width/2;
    CGFloat height=_cookTimeView.frame.size.height;
    UILabel *cook=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    cook.text=[NSString stringWithFormat:@"制作时间:%@",cookTime];
    cook.font=[UIFont systemFontOfSize:14];
    cook.textAlignment=NSTextAlignmentCenter;
    [_cookTimeView addSubview:cook];
    
    UILabel *user=[[UILabel alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    user.text=[NSString stringWithFormat:@"用餐人数:%@",userPeople];
    user.font=[UIFont systemFontOfSize:14];
    [_cookTimeView addSubview:user];
}

#pragma mark 查看更多
-(void)addWatchMore
{
    CGFloat width=_watchBigImageBtn.frame.size.width/2;
    CGFloat height= _watchBigImageBtn.frame.size.height;
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, width,height)];
    label.text=@"步骤";
    label.font=[UIFont systemFontOfSize:20];
    
    UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(width, 0, width-40, height)];
    label2.text=@"点击查看步骤大图";
    label2.font=[UIFont systemFontOfSize:14];
    label2.textColor=[UIColor lightGrayColor];
    
    UIImageView *arrows=[[UIImageView alloc] init];
    arrows.image=[UIImage imageNamed:@"ico_this_more.png"];
    arrows.frame=CGRectMake(CGRectGetMaxX(label2.frame)+5, (height-15)/2, 10 , 15);
    arrows.contentMode=UIViewContentModeScaleAspectFit;
    [_watchBigImageBtn addSubview:label];
    [_watchBigImageBtn addSubview:label2];
    [_watchBigImageBtn addSubview:arrows];
}

#pragma mark 查看详细的步骤图
-(void)addSubSteps:(NSArray *)steps
{
    CGFloat height=_setpView.frame.size.height/steps.count;
    CGFloat width=_setpView.frame.size.width;
    for (int i=0; i<steps.count; i++) {
        
        Steps *sp=steps[i];
        
        UIView *stepView=[[UIView alloc] init];
        stepView.frame=CGRectMake(0, i*height, width, height);
        [_setpView addSubview:stepView];
        
        UILabel *stepCount=[[UILabel alloc] init];
        stepCount.text=[NSString stringWithFormat:@"%d",i+1];
        stepCount.frame=CGRectMake(kMarign, kMarign, 2*kMarign, 2*kMarign);
        stepCount.textAlignment=NSTextAlignmentCenter;
        stepCount.layer.borderWidth=1;
        stepCount.font=[UIFont systemFontOfSize:12];
        stepCount.layer.borderColor=kGetColor(0.4902, 0.6353, 0.1686, 1).CGColor;
        stepCount.layer.cornerRadius=kMarign;
        
        UIImageView *stepImage= [[UIImageView alloc] init];
        stepImage.frame=CGRectMake(CGRectGetMaxX(stepCount.frame)+kMarign, kMarign, (width-CGRectGetMaxX(stepCount.frame)-kMarign)/2, height-2*kMarign);
        [stepImage setImageWithURL:[NSURL URLWithString:sp.stepPhoto] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
        
        UILabel *stepInfo=[[UILabel alloc] init];
        stepInfo.text=sp.intro;
        stepInfo.numberOfLines=0;
        stepInfo.font=[UIFont systemFontOfSize:14];
        
        CGSize size= [UIUtils sizeOfStr:sp.intro andFont:[UIFont systemFontOfSize:14] andMaxSize:CGSizeMake(width-CGRectGetMaxX(stepImage.frame)-2*kMarign, height-2*kMarign) andLineBreakMode:NSLineBreakByWordWrapping];
        
        stepInfo.frame=CGRectMake(CGRectGetMaxX(stepImage.frame)+kMarign, kMarign, size.width,  size.height);
        
        [stepView addSubview:stepCount];
        [stepView addSubview:stepImage];
        [stepView addSubview:stepInfo];
    }
}

#pragma mark 添加评论详情
-(void)addCommentItems:(NSArray *)comments
{
    
    CGFloat height=_commentView.frame.size.height/comments.count;
    CGFloat width=_commentView.frame.size.width;
    for (int i=0; i<comments.count; i++) {
        Comment *com=comments[i];
        UIView *commentView=[[UIView alloc] init];
        commentView.frame=CGRectMake(0, height*i, width, height);
        [_commentView addSubview:commentView];
        
        UIImageView *iconImage=[[UIImageView alloc] init];
        iconImage.frame=CGRectMake(kMarign, kMarign, 40, 40);
        [iconImage setImageWithURL:[NSURL URLWithString:com.avatar] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
        iconImage.layer.cornerRadius=20;
        iconImage.tag=kIconImageTag+i;
        iconImage.layer.masksToBounds=YES;
        iconImage.userInteractionEnabled=YES;
        //添加点击头像 查看详细信息
        UITapGestureRecognizer *userInfo=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showUserInfo:)];
        [iconImage addGestureRecognizer:userInfo];
        [commentView addSubview:iconImage];
        
        UILabel *comText=[[UILabel alloc] init];
        comText.text=[NSString stringWithFormat:@"%@:%@",com.userName,com.content];
        comText.frame=CGRectMake(CGRectGetMaxX(iconImage.frame)+kMarign, kMarign,width-3*kMarign-40 , (height-kMarign)/2);
        comText.font=[UIFont systemFontOfSize:15];
        [commentView addSubview:comText];
        
        UILabel *time=[[UILabel alloc] init];
        time.text=[NSString stringWithFormat:@"%@",com.createTime];
        time.font=[UIFont systemFontOfSize:12];
        time.textColor=[UIColor darkGrayColor];
        time.frame=CGRectMake(CGRectGetMaxX(iconImage.frame)+kMarign, CGRectGetMaxY(comText.frame),width-3*kMarign-40, (height-kMarign)/2);
        [commentView addSubview:time];
    }
}

#pragma mark 查看更多评论
-(void)addWatchMoreCom
{
    CGFloat width=_watchMoreBtn.frame.size.width;
    CGFloat height=_watchMoreBtn.frame.size.height;
    
    UIImageView *topImage=[[UIImageView alloc] init];
    topImage.image=kLineImage;
    topImage.frame=CGRectMake(kMarign, 0, width-kMarign, 1);
    [_watchMoreBtn addSubview:topImage];
    
    UIImageView *bomImage=[[UIImageView alloc] init];
    bomImage.image=kLineImage;
    bomImage.frame=CGRectMake(kMarign, height, width-kMarign, 1);
    [_watchMoreBtn addSubview:bomImage];
    
    UILabel *text=[[UILabel alloc] init];
    text.text=@"点击查看更多评论";
    text.frame=CGRectMake(kMarign, 0, width*0.7, height);
    text.font=[UIFont systemFontOfSize:14];
    
    UIImageView *arrows=[[UIImageView alloc] init];
    arrows.image=[UIImage imageNamed:@"ico_this_more.png"];
    arrows.frame=CGRectMake(width-40, (height-15)/2, 10, 15);
    [_watchMoreBtn addSubview:arrows];
    [_watchMoreBtn addSubview:text];
    
}

#pragma mark 添加标签页
-(void)addTags:(NSArray *)tags
{
    CGFloat width=_aboutTags.frame.size.width/4;
    int row;
    if (tags.count%4==0) {
        row=tags.count/4;
    }else
    {
        row=tags.count/4+1;
    }
    CGFloat height=_aboutTags.frame.size.height/row;
    for (int i=0; i<tags.count; i++) {
        Tag *tag=tags[i];
        TagButton *tagBtn=[TagButton buttonWithType:UIButtonTypeCustom];
        tagBtn.backgroundColor=kAllBgColor;
        tagBtn.layer.borderWidth=0.5;
        tagBtn.tag=tag;
        tagBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        tagBtn.layer.masksToBounds=YES;
        [tagBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        tagBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [tagBtn setTitle:tag.name forState:UIControlStateNormal];
        tagBtn.frame=CGRectMake(i%4*width, i/4*height, width, height);
        [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchDown];
        [_aboutTags addSubview:tagBtn];
        
    }
}
#pragma mark 标签点击
-(void)tagBtnClick:(TagButton *)btn
{
    if (_tagOpeartion) {
        _tagOpeartion(btn.tag);
    }
}

#pragma mark 跳转进入广告
-(void)showData
{
    if (_adData) {
        _adData(_menuDetialFrame.menuDetial.adData);
    }
}

#pragma mark 跳转进入评论详情
-(void)watchMoreClick
{
    if (_watchMoreOpeartion) {
        _watchMoreOpeartion(_menuDetialFrame.menuDetial.info.recipeld);
    }
}

#pragma mark 查看用户详细信息
-(void)showUserInfo:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView=(UIImageView *)tap.view;
    if (_showUserInfoOpeartion) {
        Comment *comment=_menuDetialFrame.menuDetial.commentArray[imageView.tag-kIconImageTag];
        _showUserInfoOpeartion(comment.userId,comment.userName);
    }
}
#pragma mark 查看个人信息
-(void)avatarClick:(UITapGestureRecognizer *)tap
{
    if (_showUserInfoOpeartion) {
        _showUserInfoOpeartion(_menuDetialFrame.menuDetial.info.userId,_menuDetialFrame.menuDetial.info.userName);
    }
}

@end
