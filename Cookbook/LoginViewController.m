//
//  LoginViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

#define kSpaceTop 20
#define kSpaceLeft 10
#define kNavSpace 64
#define kTextFieldWidth 240
#define kTextFieldHeight 30
#define kIconWidth 14
#define KiconHeight 18
#define kLoginBtnWidth 220
#define kLoginBtnHeight 30
#define kTextClolr kGetColor(0.4902, 0.6353, 0.1686, 1)
#define kBtnNames @[@"天天登陆",@"QQ登陆",@"微博登陆"]
#define kOtherNames @[@"忘记密码?",@"快速注册好豆账号"]
#define kTagOtherTag 1500
#define kAccountKey @"currectAccount"
@interface LoginViewController ()
{
    UIView *_view;
    UITextField *_account;
    UITextField *_password;
    CGFloat _currectY;
}
@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"登陆";
    _view= [[UIView alloc] init];
    _view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabBarHeight);
    _view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_view];

    [self initSubItems];
    
    //读取是否有当前账户
    [self loadCurrectAccount];
}

#pragma mark 读取当前账户
-(void)loadCurrectAccount
{
    NSDictionary *account=[[NSUserDefaults standardUserDefaults] objectForKey:kAccountKey];
    if (account) {
        _account.text = account[@"accountName"];
        _password.text=account[@"password"];
    }
    else
    {
        _account=nil;
        _password=nil;
    }
}

#pragma mark 初始化控件
-(void)initSubItems
{
    [self addAccountInfo];
    
    [self addLoginBtn];
    
    [self addOtherItems];
}

-(void)addAccountInfo
{
    //账户图标
    UIImageView *accountIcon=[[UIImageView alloc] init];
    accountIcon.image=[UIImage imageNamed:@"icon_yonghu.png"];
    accountIcon.frame=CGRectMake(kSpaceTop, 40+kNavSpace, kIconWidth, KiconHeight);
    [_view addSubview:accountIcon];
    //账户
    CGFloat x=CGRectGetMaxX(accountIcon.frame)+kSpaceLeft;
    _account=[[UITextField alloc] init];
    _account.frame=CGRectMake(x, 30+kNavSpace, kTextFieldWidth, kTextFieldHeight);
    _account.font=[UIFont systemFontOfSize:13];
    [_view addSubview:_account];
    
    UIImageView *lineImage=[[UIImageView alloc] init];
    lineImage.image=kLineImage;
    lineImage.frame=CGRectMake(x, CGRectGetMaxY(_account.frame), kTextFieldWidth, 1);
    [_view addSubview:lineImage];
    
    //密码图标
    UIImageView *passwordIcon=[[UIImageView alloc] init];
    passwordIcon.image=[UIImage imageNamed:@"icon_mima.png"];
    passwordIcon.frame=CGRectMake(kSpaceTop, CGRectGetMaxY(accountIcon.frame)+kSpaceTop, kIconWidth, KiconHeight);
    [_view addSubview:passwordIcon];
    //密码
    _password=[[UITextField alloc] init];
    _password.frame=CGRectMake(x, CGRectGetMaxY(_account.frame)+kSpaceTop/2-4, kTextFieldWidth, kTextFieldHeight);
    _password.font=[UIFont systemFontOfSize:13];
    _password.secureTextEntry=YES;
    [_view addSubview:_password];
    
    UIImageView *lineImage2=[[UIImageView alloc] init];
    lineImage2.image=kLineImage;
    lineImage2.frame=CGRectMake(x, CGRectGetMaxY(_password.frame), kTextFieldWidth, 1);
    [_view addSubview:lineImage2];
}
#pragma mark 增加登陆按钮
-(void)addLoginBtn
{
    CGFloat x=(self.view.frame.size.width-kLoginBtnWidth)/2;
    _currectY=CGRectGetMaxY(_password.frame)+kSpaceTop*2;
    for (int i=0; i<kBtnNames.count; i++) {
        UIButton *loginBySky=[UIButton buttonWithType:UIButtonTypeCustom];
        loginBySky.layer.borderWidth=1;
        if (i==0) {
           loginBySky.layer.borderColor=kTextClolr.CGColor;
           [loginBySky setTitleColor:kTextClolr forState:UIControlStateNormal];
        }else
        {
           loginBySky.layer.borderColor=[UIColor blackColor].CGColor;
           [loginBySky setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        loginBySky.layer.masksToBounds=YES;
        loginBySky.layer.cornerRadius=5;
        [loginBySky setTitle:kBtnNames[i] forState:UIControlStateNormal];
        [loginBySky addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchDown];
        loginBySky.frame=CGRectMake(x, _currectY, kLoginBtnWidth, kLoginBtnHeight);
        _currectY=CGRectGetMaxY(loginBySky.frame)+kSpaceTop;
        loginBySky.backgroundColor=[UIColor clearColor];
        loginBySky.titleLabel.font=[UIFont systemFontOfSize:13];
        [_view addSubview:loginBySky];
    }

}

#pragma mark 登陆
-(void)login:(UIButton *)btn
{
    //天天登陆
    if ([btn.titleLabel.text isEqualToString:kBtnNames[0]]) {
        
        //登陆成功
        if ([self loginRequest]) {
            NSDictionary *userDic=[NSDictionary dictionaryWithObjectsAndKeys:_account.text,@"accountName",_password.text,@"password", nil];
            NSUserDefaults *df= [NSUserDefaults standardUserDefaults];
            [df setObject:userDic forKey:kAccountKey];
            [df synchronize]; 
        }
        else
        {
            
        }
        
    }
    //qq登陆
    else if ([btn.titleLabel.text isEqualToString:kBtnNames[1]])
    {
        ILLog(@"QQ登陆");
    }
    //微博登陆
    else if([btn.titleLabel.text isEqualToString:kBtnNames[2]])
    {
        ILLog(@"微博登陆");
    }
}

#pragma mark 登陆
-(BOOL)loginRequest
{
    return YES;
}

#pragma mark 增加注册和忘记密码
-(void)addOtherItems
{
    CGFloat x=(self.view.frame.size.width-kLoginBtnWidth)/2;
    for (int i=0; i<kOtherNames.count; i++) {
        UIButton *otherItems=[UIButton buttonWithType:UIButtonTypeCustom];
        [otherItems setTitle:kOtherNames[i] forState:UIControlStateNormal];
        [otherItems setTitleColor:kTextClolr forState:UIControlStateNormal];
        otherItems.frame=CGRectMake(x, _currectY, kLoginBtnWidth, kLoginBtnHeight);
        otherItems.titleLabel.font=[UIFont systemFontOfSize:13];
        otherItems.tag=kTagOtherTag+i;
        [otherItems addTarget:self action:@selector(otherClick:) forControlEvents:UIControlEventTouchDown];
        [_view addSubview:otherItems];
        _currectY=CGRectGetMaxY(otherItems.frame);
    }
}

#pragma mark 其他点击事件
-(void)otherClick:(UIButton *)btn
{
    //忘记密码
    if ((btn.tag-1500)==0) {
        
    }
    else//快速注册
    {
        RegisterViewController *reg=[[RegisterViewController alloc] init];
        [self.navigationController pushViewController:reg animated:YES];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setEditing:NO];
    
    if (_account.becomeFirstResponder) {
        [_account resignFirstResponder];
    }else if (_password.becomeFirstResponder)
    {
        [_password resignFirstResponder];
    }
}




@end
