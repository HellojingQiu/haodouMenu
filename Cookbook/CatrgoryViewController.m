//
//  CatrgoryViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CatrgoryViewController.h"
#import "SubItem.h"
#import "CategoryModel.h"
#import "CategoryListViewController.h"

#define kCategoryNames @[@"热门分类",@"流行食材",@"常见功效",@"菜系",@"菜品",@"加工工艺",@"厨房用具",@"口味",@"场景"]
#define kCategoryIcons @[@"category_ico_hot.png",@"category_ico_prevalent.png",@"category_ico_effect.png",@"category_ico_recipe.png",@"category_ico_taste.png",@"category_ico_process.png",@"category_ico_tool.png",@"category_ico_savour.png",@"category_ico_scene.png"]
#define kCategory_URL @"http://api.hoto.cn/index.php?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404959036&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Search.getCateListV3"

@interface CatrgoryViewController ()
{
    NSMutableDictionary *_dic;
}
@end

@implementation CatrgoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"分类";
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dic=[NSMutableDictionary dictionary];
    
    //添加分类
    [self addCategory];
    //加载数据
    [self loadData];
}

#pragma mark 加载数据
-(void)loadData
{
    [UIUtils loadDataByUrl:kCategory_URL success:^(id JsonData) {
        
        NSArray *array=JsonData[@"result"][@"list"];
        for (int i=0; i<array.count; i++) {
            CategoryModel *model=[CategoryModel initWithDic:array[i]];
            [_dic setObject:model forKey:model.cate];
        }
    } failed:^{
        
    }];
}

#pragma mark 添加分类
-(void)addCategory
{
    CGFloat width=self.view.frame.size.width/3;
    
    int index=0;
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            SubItem *subItem=[[SubItem alloc] initWithFrame:CGRectMake(j*width, i*width, width, width)];
            [subItem setTitle:kCategoryNames[index] forState:UIControlStateNormal];
            [subItem setImage:[UIImage imageNamed:kCategoryIcons[index]] forState:UIControlStateNormal];
            [subItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            subItem.titleLabel.font=[UIFont systemFontOfSize:14];
            subItem.backgroundColor=[UIColor whiteColor];
            [subItem addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            index++;
            [self.view addSubview:subItem];
            //添加中线
            if (i!=0) {
                UIImageView *line=[[UIImageView alloc] init];
                UIImage *lineImage= kLineImage;
                line.image=[lineImage stretchableImageWithLeftCapWidth:2 topCapHeight:2];
                line.frame=CGRectMake(0, width*i, kScreenWidth, 1);
                [self.view addSubview:line];
            }
        }
    }
    //画渐变线
    for (int j=1; j<3; j++) {
        UIImageView *shadeLine=[[UIImageView alloc] initWithFrame:CGRectMake(width*j, 0, 1, 3*width)];
        shadeLine.image=kLineImage;
        shadeLine.contentMode=UIViewContentModeScaleToFill;
        [self.view addSubview:shadeLine];
    }
}

#pragma mark 分类点击事件
-(void)btnClick:(UIButton *)btn
{
    CategoryModel *model=[_dic objectForKey:btn.titleLabel.text];
    CategoryListViewController *categoryListVc=[[CategoryListViewController alloc] init];
    categoryListVc.categoryItems=model.tags;
    categoryListVc.cateTitle=model.cate;
    [self.navigationController pushViewController:categoryListVc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
