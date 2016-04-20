//
//  ViewController.m
//  LivingTrust
//
//  Created by dev on 2016. 3. 10..
//  Copyright © 2016 company.KO. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "NJKWebViewProgressView.h"

@interface ViewController (){
    //IBOutlet __weak UIWebView *_webView;
    IBOutlet __weak UIWebView *_webView;
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
    
    
}
@property (strong, nonatomic) MBProgressHUD *loader;
#define PATH_URL @"http://www.livingtrustexpress.com"
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    [self loadWebSite];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
}
-(void)webViewDidStartLoad :(UIWebView *)webView{
}
-(void)didFailLoadWithError:(UIWebView *)webView{

    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:nil message:@"Living Trust Connection Faild."
                                          delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Remove progress view
    // because UINavigationBar is shared with other ViewControllers
    [_progressView removeFromSuperview];
}

- (IBAction)searchButtonPushed:(id)sender {
    [self loadWebSite];
}

- (IBAction)reloadButtonPushed:(id)sender {
    [_webView reload];
}

- (IBAction)buttonForwoard:(id)sender {
    if ([_webView canGoForward]) {
        [_webView goForward];
    }
}

- (IBAction)buttonBack:(id)sender {
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
}

-(void)loadWebSite{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:PATH_URL]];
    [_webView loadRequest:req];
}
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];

    if ([_webView canGoForward])
        [self.Forwoard setEnabled:YES];
    else
        [self.Forwoard setEnabled:NO];
    
    if ([_webView canGoBack])
        [self.back setEnabled:YES];
    else
        [self.back setEnabled:NO];

}
@end
