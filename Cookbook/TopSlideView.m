//
//  TopSlideView.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "TopSlideView.h"
#import "TopShowImageView.h"
@interface TopSlideView()
{
    UIPageControl *_pageController;
    UIScrollView *_mainScrollView;
}
@end

@implementation TopSlideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _mainScrollView=[[UIScrollView alloc] initWithFrame:frame];
        _mainScrollView.delegate=self;
        _mainScrollView.pagingEnabled=YES;
        _mainScrollView.showsHorizontalScrollIndicator=NO;
        
        _pageController=[[UIPageControl alloc] init];
        _pageController.frame=CGRectMake(200, 150, 100, 30);
        _pageController.enabled=NO;
        [self addSubview:_mainScrollView];
        [self addSubview:_pageController];
    }
    return self;
}

/**
 *  重写set方法在设置数据的时候设置当前Scrollview的数据
 *
 *  @param dataArray 数据
 */
-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray=dataArray;
    //设置ScrollView的滑动范围
    _mainScrollView.contentSize=CGSizeMake(self.frame.size.width*dataArray.count, 0);
    _pageController.numberOfPages=dataArray.count;
//    _pageController 
    [self addImageView];
}

/**
 *  添加滑动的imageView
 */
-(void)addImageView
{
    CGSize size=self.frame.size;
    for (int i=0; i<_dataArray.count; i++) {
        TopShowImageView *imageView=[[TopShowImageView alloc] initWithFrame:CGRectMake(size.width*i, 0, size.width, size.height)];
        imageView.recipe=_dataArray[i];
        imageView.imageViewClick=^(Recipe *recip)
        {
            _topSlideView(recip);
        };
        [_mainScrollView addSubview:imageView];
        
    }

}
#pragma mark 滑动事件
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int currectCount=scrollView.contentOffset.x/scrollView.frame.size.width;
    _pageController.currentPage=currectCount;
}

@end
