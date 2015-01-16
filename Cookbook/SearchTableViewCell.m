//
//  SearchTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "BaseCellModel.h"
#import "SearchCellArrows.h"

#define kArrowsRadiusIcon @"ico_radius_arrow_right.png"
#define kArrowsMoreIcon @"ico_more_arrow_right.png"

@implementation SearchTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *line=[[UIImageView alloc] init];
        line.image=kLineImage;
        line.frame=CGRectMake(0, self.frame.size.height-1, kScreenWidth, 1);
        [self addSubview:line];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setBaseCellModel:(BaseCellModel *)baseCellModel
{
    _baseCellModel=baseCellModel;
    self.textLabel.text=baseCellModel.title;
    if (baseCellModel.icon) {
            self.imageView.image=[UIImage imageNamed:baseCellModel.icon];
    }
    if ([baseCellModel isKindOfClass:[SearchCellArrows class]]) {
        SearchCellArrows *search=(SearchCellArrows *)baseCellModel;
        //非圆角箭头
        if (search.arrowsType==ArrowsTypeMoreArrow) {
            self.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:kArrowsMoreIcon]];
        }
        //圆角箭头
        else
        {
            self.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:kArrowsRadiusIcon]];
        }
    }
    else if([baseCellModel isKindOfClass:[BaseCellModel class]])
    {
    
    }
}

@end
