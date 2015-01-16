//
//  MenuCategoryItemsView.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuCategoryItemsView.h"
#import "Tag.h"
#define kRowCount 4
#define kCategoryTag 100

@implementation MenuCategoryItemsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

-(void)setTagArray:(NSArray *)tagArray
{
    _tagArray=tagArray;
    
    CGFloat width=self.frame.size.width/kRowCount;
    CGFloat height=self.frame.size.height/(_tagArray.count/kRowCount);

    int index=0;
    
    for (int i=0; i<_tagArray.count; i++) {
        if (i==((_tagArray.count/kRowCount)*4)) {
            break;
        }
        Tag *tag=_tagArray[i];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:tag.name forState:UIControlStateNormal];
        btn.frame=CGRectMake(i%4*width, i/4*height, width, height);
        [btn setTitleColor:kGetColor(0.4275, 0.4235, 0.4275, 1) forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        btn.tag=kCategoryTag+i;
        [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        index++;
        
        //添加边界线
        if (i%4>0&&i/4==0) {
            [self addLineImageView:CGRectMake(i%4*width, i/4*height, 1, self.frame.size.height)];
        }
        if (i/4!=0) {
            [self addLineImageView:CGRectMake(0, i/4*height, self.frame.size.width, 1)];

        }
    }
}

#pragma mark 添加边界线
-(void)addLineImageView:(CGRect)rect
{
    UIImageView *colLine=[[UIImageView alloc] init];
    colLine.backgroundColor=kGetColor(0.9490, 0.9490, 0.9490, 1);
    colLine.frame=rect;
    [self addSubview:colLine];
}

#pragma mark 点击事件
-(void)itemClick:(UIButton *)btn
{
    if (_categoryItemBtnBlock) {
        _categoryItemBtnBlock(btn.tag-100);
    }
}

@end
