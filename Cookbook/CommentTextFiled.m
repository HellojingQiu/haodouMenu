//
//  CommentTextFiled.m
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CommentTextFiled.h"
#define kMargin 10

@interface CommentTextFiled()
{
    UITextField *_myTextFiled;
    
    UIButton *_sendButton;
    
    CGRect _frame;
}
@end

@implementation CommentTextFiled

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _frame=frame;

        
        [self addItems];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}



#pragma mark 添加子控件
-(void)addItems
{
    _myTextFiled=[[UITextField alloc] init];
    _myTextFiled.frame=CGRectMake(kMargin, kMargin, 250, self.frame.size.height-2*kMargin);
    _myTextFiled.placeholder=@"我来说两句";
    _myTextFiled.font=[UIFont systemFontOfSize:14];
    _myTextFiled.textColor=[UIColor lightGrayColor];
    _myTextFiled.layer.borderWidth=1;
    _myTextFiled.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _myTextFiled.layer.cornerRadius=5;
    _myTextFiled.layer.masksToBounds=YES;
    _myTextFiled.delegate=self;
    [self addSubview:_myTextFiled];
    
    _sendButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton setTitleColor:kGetColor(0.4902, 0.6353, 0.1686, 1) forState:UIControlStateNormal];
    _sendButton.frame=CGRectMake(CGRectGetMaxX(_myTextFiled.frame)+kMargin, kMargin/2, 40, self.frame.size.height-kMargin);
//    _sendButton.enabled=NO;
    [_sendButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchDown];
    [self addSubview:_sendButton];
}

#pragma mark 发送按钮点击
-(void)sendMessage
{
    [self.delegate textFiledEndEdit:self inputStr:_myTextFiled.text];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

#pragma mark 开启编辑
-(void)isStartEdit:(BOOL)state
{
    if (state==YES) {
        [_myTextFiled becomeFirstResponder];
    }
    else
    {
        [_myTextFiled resignFirstResponder];
        [UIView  animateWithDuration:0 animations:^{
            self.frame = _frame;
        }];
    }
}

@end
