//
//  OpinionFeedViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "OpinionFeedViewController.h"

@interface OpinionFeedViewController ()
{
    UITextView *_textField;
}
@end

@implementation OpinionFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"意见反馈";
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *left=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(close)];
    left.tintColor=kGetColor(0.4902, 0.6353, 0.1686, 1);
    
    self.navigationItem.leftBarButtonItem = left;
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleBordered target:self action:@selector(publish)];
    right.tintColor=kGetColor(0.4902, 0.6353, 0.1686, 1);
    self.navigationItem.rightBarButtonItem=right;
    
    [self addTextField];
}

-(void)addTextField
{
    _textField=[[UITextView alloc] init];
    _textField.text=@"请提出您宝贵的意见";
    _textField.font=[UIFont systemFontOfSize:15];
    _textField.textColor=[UIColor darkGrayColor];
    _textField.frame=CGRectMake(0, 0, kScreenWidth, 300);
    _textField.backgroundColor=[UIColor whiteColor];
    _textField.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:_textField];
    
}

#pragma mark 关闭
-(void)close
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 发表
-(void)publish
{
    if ([_textField.text isEqualToString:@""]) {
        [UIUtils showHudWithTitle:@"您没有提意见" success:YES];
    }else{
        [UIUtils showHudWithTitle:@"谢谢您的宝贵意见" success:YES];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
}


@end
