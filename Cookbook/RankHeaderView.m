//
//  RankHeaderView.m
//  Cookbook
//
//  Created by chengfang on 14-12-9.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "RankHeaderView.h"

@interface RankHeaderView()
{
    UIImageView *_iconImage;
}
@end

@implementation RankHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
        _iconImage=[[UIImageView alloc] init];
        _iconImage.frame=CGRectMake(280, (self.frame.size.height-20)/2, 20, 20);
        
        UIImageView *lineInmage=[[UIImageView alloc] init];
        lineInmage.image=kLineImage;
        lineInmage.frame=CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
        [self addSubview:lineInmage];
        [self addSubview:_iconImage];
    }
    return self;
}

-(UILabel *)titleLabel
{
    if (_titleLabel==nil) {
        _titleLabel=[[UILabel alloc] init];
        _titleLabel.frame=CGRectMake(20, 0 , 200, self.frame.size.height);
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

-(void)setHide:(BOOL)hide
{
    _hide=hide;
    //显示
    if (hide) {
        _iconImage.image=[UIImage imageNamed:@"ico_radius_arrow_down.png"];
    }
    else
    {
        _iconImage.image=[UIImage imageNamed:@"ico_radius_arrow_up.png"];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(rankHeaderViewDidSelected:)]) {
        [self.delegate rankHeaderViewDidSelected:self];
    }
}

@end
