//
//  WebViewController.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
}
@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=kAllBgColor;
    }
    return self;
}

-(void)setWebTitle:(NSString *)webTitle
{
    _webTitle=webTitle;
    self.title=webTitle;
    
    _webView=[[UIWebView alloc] init];
    _webView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabBarHeight-64);
    _webView.delegate=self;
    [self.view addSubview:_webView];
//    [UIUtils showHudWithTitle:@"正在加载..." view:_webView];
//    NSString *encodedString=[_webUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *weburl = [NSURL URLWithString:encodedString];
    NSURL *url=[NSURL URLWithString:_webUrl];
    NSURLRequest *request=[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    [_webView loadRequest:request];
    
}

#pragma mark webView代理
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIUtils showHudWithTitle:@"正在加载.." view:_webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIUtils hiddenHudWithView:_webView];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIUtils hiddenHudWithView:_webView];
    [UIUtils showHudWithTitle:@"亲,您的网络不给力啊" success:NO];
    ILLog(@"%@",error.localizedDescription);
}
#pragma mark 覆盖上下刷新
-(void)loadFirstData{};
-(void)addFootAndHeader{};
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{}

@end
