//
//  SettingTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SettingTableViewCell.h"
#import "SettingSwitchCellModel.h"
#import "SettingArrowsCellModel.h"
#import "SettingLabelCellModel.h"
@implementation SettingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
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

-(void)setBaseCell:(SettingBaseCellModel *)baseCell
{
    _baseCell=baseCell;
    
    if (baseCell.cellImage) {
        self.imageView.image=[UIImage imageNamed:baseCell.cellImage];
    }
    self.textLabel.text=baseCell.cellTitle;
    
    //带箭头的cell
    if ([baseCell isKindOfClass:[SettingArrowsCellModel class]]) {
        SettingArrowsCellModel *arrows=(SettingArrowsCellModel *)baseCell;
        self.detailTextLabel.text=arrows.subTitle;
        UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_this_more.png"]];
        self.accessoryView=imageView;
    }
    //开关
    else if ([baseCell isKindOfClass:[SettingSwitchCellModel class]])
    {
        self.accessoryView=[[UISwitch alloc] init];
    }
    //文本
    else if([baseCell isKindOfClass:[SettingLabelCellModel class]])
    {
        SettingLabelCellModel *labelModel=(SettingLabelCellModel *)baseCell;
        UILabel *label=[[UILabel alloc] init];
        label.bounds=CGRectMake(0, 0, 100, 44);
        label.textAlignment=NSTextAlignmentRight;
        label.text=labelModel.subTitle;
        label.font=[UIFont systemFontOfSize:13];
        self.accessoryView=label;
    }
    
}

@end
