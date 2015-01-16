//
//  RegisterViewController.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "RegisterViewController.h"
#define kTextClolr kGetColor(0.4902, 0.6353, 0.1686, 1)
#define kPhone @"手机注册"
#define kMail @"邮箱注册"
#define kFont [UIFont systemFontOfSize:16]
#define kTopMaragin 30
#define kButtonwidth (kScreenWidth-2*(kTopMaragin+10+14))

@interface RegisterViewController ()
{
    UIView *_phoneView;
    UIView *_emailView;
    UIView *_topView;
    UIButton *_phone;
    UIButton *_mail;
    UIView *_lineView;
    UITextField *_phoneNumber;
    UITextField *_emailInput;
    UITextField *_userNameInput;
    UITextField *_userPassword;
    
}
@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"注册";
    self.view.backgroundColor=[UIColor whiteColor];
    //添加顶部的选择条
    [self addTopChoice];
    //手机注册
    [self phoneRegister];
    //邮箱注册
    [self emailRegister];
    
    [self choickRegister:_phone];
}

#pragma mark 顶部选择条
-(void)addTopChoice
{
    
    CGSize size=[UIUtils sizeOfStr:kPhone andFont:kFont andMaxSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX) andLineBreakMode:NSLineBreakByWordWrapping];
    
    _topView=[[UIView alloc] init];
    _topView.frame=CGRectMake(0, 64, self.view.frame.size.width, 44);
    _topView.backgroundColor=[UIColor whiteColor];
    
    CGFloat btnWidth=_topView.frame.size.width/2;
    
    _phone=[UIButton buttonWithType:UIButtonTypeCustom];
    [_phone setTitle:kPhone forState:UIControlStateNormal];
    _phone.frame=CGRectMake(0, 0, btnWidth, 44);
    _phone.titleLabel.font=kFont;
    [_phone setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_phone setTitleColor:kTextClolr forState:UIControlStateSelected];
    [_phone addTarget:self action:@selector(choickRegister:) forControlEvents:UIControlEventTouchDown];
    [_topView addSubview:_phone];

    
    _mail=[UIButton buttonWithType:UIButtonTypeCustom];
    [_mail setTitle:kMail forState:UIControlStateNormal];
    _mail.frame=CGRectMake(CGRectGetMaxX(_phone.frame), 0, btnWidth, 44);
    _mail.titleLabel.font=kFont;
    [_mail setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_mail setTitleColor:kTextClolr forState:UIControlStateSelected];
    [_mail addTarget:self action:@selector(choickRegister:) forControlEvents:UIControlEventTouchDown];
    [_topView addSubview:_mail];
    
    _lineView=[[UIView alloc] init];
    _lineView.backgroundColor=kTextClolr;
    _lineView.frame=CGRectMake((self.view.frame.size.width/2-size.width)/2, CGRectGetMaxY(_phone.frame)-2, size.width, 2);
    [_topView addSubview:_lineView];
    [self.view addSubview:_topView];
}

#pragma mark 手机注册
-(void)phoneRegister
{
    _phoneView=[[UIView alloc] init];
    _phoneView.frame=CGRectMake(0, CGRectGetMaxY(_topView.frame), kScreenWidth,kScreenHeight -_topView.frame.size.height-64-kTabBarHeight);
    _phoneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_phoneView];
    
    //手机图标
    UIImageView *phoneIcon=[[UIImageView alloc] init];
    phoneIcon.image=[UIImage imageNamed:@"icon_shouji.png"];
    phoneIcon.frame=CGRectMake(kTopMaragin, kTopMaragin, 14, 18);
    [_phoneView addSubview:phoneIcon];
    
    CGFloat x=CGRectGetMaxX(phoneIcon.frame)+10;
    
    //手机号码输入框
    _phoneNumber=[[UITextField alloc] init];
    _phoneNumber.frame=CGRectMake(x, kTopMaragin, kButtonwidth, 30);
    _phoneNumber.placeholder=@"请输入手机号码";
    _phoneNumber.keyboardType=UIKeyboardTypeNumberPad;
    [_phoneView addSubview:_phoneNumber];
    
    //下划线
    UIImageView *lineImage=[[UIImageView alloc] init];
    lineImage.image=kLineImage;
    lineImage.frame=CGRectMake(x, CGRectGetMaxY(_phoneNumber.frame), kButtonwidth, 1);
    [_phoneView addSubview:lineImage];
    
    [self addOtherNext:lineImage.frame view:_phoneView];
}

#pragma mark 邮箱注册
-(void)emailRegister
{
    _emailView=[[UIView alloc] init];
    _emailView.frame=CGRectMake(kScreenWidth, CGRectGetMaxY(_topView.frame), kScreenWidth,kScreenHeight -_topView.frame.size.height-64-kTabBarHeight);
    _emailView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_emailView];
    
    //邮箱图标
    UIImageView *emailIcon=[[UIImageView alloc] init];
    emailIcon.image=[UIImage imageNamed:@"icon_email.png"];
    emailIcon.frame=CGRectMake(kTopMaragin, kTopMaragin, 14, 18);
    [_emailView addSubview:emailIcon];
    
    CGFloat x=CGRectGetMaxX(emailIcon.frame)+10;
    
    //邮箱输入框
    _emailInput=[[UITextField alloc] init];
    _emailInput.frame=CGRectMake(x, kTopMaragin, kButtonwidth, 30);
    _emailInput.placeholder=@"请输入电子邮箱";
    [_emailView addSubview:_emailInput];
    
    //下划线
    UIImageView *lineImage=[[UIImageView alloc] init];
    lineImage.image=kLineImage;
    lineImage.frame=CGRectMake(x, CGRectGetMaxY(_emailInput.frame), kButtonwidth, 1);
    [_emailView addSubview:lineImage];
    
    //昵称图标
    UIImageView *userIcon=[[UIImageView alloc] init];
    userIcon.image=[UIImage imageNamed:@"icon_yonghu.png"];
    userIcon.frame=CGRectMake(kTopMaragin,CGRectGetMaxY(emailIcon.frame)+kTopMaragin, 14, 18);
    [_emailView addSubview:userIcon];
    
    //昵称输入框
    _userNameInput=[[UITextField alloc] init];
    _userNameInput.frame=CGRectMake(x,CGRectGetMaxY(lineImage.frame)+15, kButtonwidth, 30);
    _userNameInput.placeholder=@"请输入用户昵称";
    [_emailView addSubview:_userNameInput];
    
    //下划线
    UIImageView *lineImage1=[[UIImageView alloc] init];
    lineImage1.image=kLineImage;
    lineImage1.frame=CGRectMake(x, CGRectGetMaxY(_userNameInput.frame), kButtonwidth, 1);
    [_emailView addSubview:lineImage1];
    
    //密码
    UIImageView *passworldIcon=[[UIImageView alloc] init];
    passworldIcon.image=[UIImage imageNamed:@"icon_mima.png"];
    passworldIcon.frame=CGRectMake(kTopMaragin,CGRectGetMaxY(userIcon.frame)+kTopMaragin, 14, 18);
    [_emailView addSubview:passworldIcon];
    
    //昵称输入框
    _userPassword=[[UITextField alloc] init];
    _userPassword.frame=CGRectMake(x,CGRectGetMaxY(_userNameInput.frame)+15, kButtonwidth, 30);
    _userPassword.placeholder=@"请输入用户密码";
    _userPassword.secureTextEntry=YES;
    [_emailView addSubview:_userPassword];
    
    //下划线
    UIImageView *lineImage3=[[UIImageView alloc] init];
    lineImage3.image=kLineImage;
    lineImage3.frame=CGRectMake(x, CGRectGetMaxY(_userPassword.frame), kButtonwidth, 1);
    [_emailView addSubview:lineImage3];
    
    [self addOtherNext:lineImage3.frame view:_emailView];
}

-(void)addOtherNext:(CGRect)frame view:(UIView *)view
{
    CGFloat x=kTopMaragin+14+10;
    //下一步
    UIButton *nextStep=[UIButton buttonWithType:UIButtonTypeCustom];
    [nextStep setTitle:@"下一步" forState:UIControlStateNormal];
    [nextStep setTitleColor:kTextClolr forState:UIControlStateNormal];
    nextStep.layer.borderWidth=1;
    nextStep.layer.borderColor=kTextClolr.CGColor;
    nextStep.layer.cornerRadius=5;
    nextStep.layer.masksToBounds=YES;
    nextStep.frame=CGRectMake(x, CGRectGetMaxY(frame)+kTopMaragin, kButtonwidth, 40);
    [view addSubview:nextStep];
    
    //文本
    UILabel *label=[[UILabel alloc] init];
    label.text=@"注册既表示同意<天天服务协议>";
    label.frame=CGRectMake(x, CGRectGetMaxY(nextStep.frame), kButtonwidth, 40);
    label.font=[UIFont systemFontOfSize:12];
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    
    //直接登录
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitleColor:kTextClolr forState:UIControlStateNormal];
    [back setTitle:@"已有天天账号,点击登录" forState:UIControlStateNormal];
    back.frame=CGRectMake(x, CGRectGetMaxY(label.frame), kButtonwidth, 40);
    back.titleLabel.font=[UIFont systemFontOfSize:12];
    [view addSubview:back];

}

#pragma mark 顶部点击事件
-(void)choickRegister:(UIButton *)btn
{
    btn.selected=YES;
    //手机注册
    if ([btn.titleLabel.text isEqualToString:kPhone]) {
        _mail.selected=NO;
        CGRect frame=_lineView.frame;
        frame.origin.x-=_topView.frame.size.width/2;
        CGRect emailFrame=_emailView.frame;
        CGRect phoneFrame=_phoneView.frame;
        emailFrame.origin.x+=kScreenWidth;
        phoneFrame.origin.x+=kScreenWidth;
        if (frame.origin.x>0) {
            [UIView animateWithDuration:0.3 animations:^{
                    _lineView.frame=frame;
                _emailView.frame=emailFrame;
                _phoneView.frame=phoneFrame;
            }];
        }
    }else//邮箱注册
    {
        _phone.selected=NO;
        CGRect frame=_lineView.frame;
        frame.origin.x+=_topView.frame.size.width/2;
        CGRect phoneFrame=_phoneView.frame;
        phoneFrame.origin.x-=kScreenWidth;
        CGRect emailFrame=_emailView.frame;
        emailFrame.origin.x-=kScreenWidth;
        if (frame.origin.x<kScreenWidth) {
            [UIView animateWithDuration:0.3 animations:^{
                _lineView.frame=frame;
                _phoneView.frame=phoneFrame;
                _emailView.frame=emailFrame;
            }];
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_phoneNumber becomeFirstResponder]) {
        [_phoneNumber resignFirstResponder];
    }
}
@end
