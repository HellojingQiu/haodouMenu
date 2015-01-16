//
//  TopShowImageView.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "TopShowImageView.h"
#import "Recipe.h"

#define kLabelTextColor kGetColor(0.5216, 0.6784, 0.3255, 1)
#define kLabelTextSize 15

@interface TopShowImageView()
{
    //标题
    UILabel *_title;
    //作者
    UILabel *_userName;
}
@end

@implementation TopShowImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        self.backgroundColor=[UIColor grayColor];
        [self addSubLabel];
    }
    return self;
}

/**
 *  添加子控件 并设置属性
 */
-(void)addSubLabel
{
    CGFloat height=30;
    _title=[[UILabel alloc] init];
    _title.textColor=kLabelTextColor;
    _title.font=[UIFont systemFontOfSize:kLabelTextSize];
    _title.frame=CGRectMake(10, self.frame.size.height-height, self.frame.size.width/2, height);
    [self addSubview:_title];

    _userName=[[UILabel alloc] init];
    _userName.textColor=kLabelTextColor;
    _userName.font=[UIFont systemFontOfSize:kLabelTextSize];
    _userName.frame=CGRectMake(CGRectGetMaxX(_title.frame), self.frame.size.height-height, self.frame.size.width/2, height);
    [self addSubview:_userName];
}

-(void)setRecipe:(Recipe *)recipe
{
    _recipe=recipe;
//    ILLog(@"%@",recipe.userName);
    _title.text=recipe.title;
    _userName.text=[NSString stringWithFormat:@"by %@",recipe.userName];
    
    [self setImageWithURL:[NSURL URLWithString:recipe.cover] placeholderImage:[UIImage imageNamed:@"Default_big.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

/**
 *  点击事件跳转
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_imageViewClick) {
        _imageViewClick(_recipe);
    }
}


@end
