//
//  XGZLDetailWebViewCtrl.m
//  FJFXT-PhaseII
//
//  Created by shiqyn on 14-6-21.
//  Copyright (c) 2014年 istrong. All rights reserved.
//

#import "STWebViewController.h"

@interface STWebViewController ()

@end

@implementation STWebViewController
@synthesize urlString;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];

    
 
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    webView.height = self.view.height - self.navigationController.navigationBar.height;
  
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _reloadButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                  target:self
                                                                  action:@selector(reload)];
    
    _forwardButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-arrowright.png"]//arrowright.png
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(goForward)];
    _forwardButton.enabled = NO;
    
    // Shows the last page, is disabled by default. Web view checks if it can go back and disables the button if neccessary PWWebViewControllerArrowLeft
    _backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-arrowleft.png"]
                                                   style:UIBarButtonItemStylePlain
                                                  target:self
                                                  action:@selector(goBack)];
    _backButton.enabled = NO;
    
    _reloadButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-fresh.png"]
                                                     style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(reload)];
    
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,  self.view.frame.size.height - 49.0, self.view.frame.size.width, 49.0)];
    _flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    _toolbar.items = [NSArray arrayWithObjects:_backButton,_flexibleSpace, _forwardButton,_flexibleSpace,  _reloadButton, nil];
    
    [self.view addSubview:_toolbar];
  
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,64,
                                                          self.view.frame.size.width, self.view.height -_toolbar.height-64)];
    
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    theProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 1)];
    _progressProxy = [[NJKWebViewProgress alloc] init];
    theProgressView.progressTintColor =  [UIColor blueColor];
    theProgressView.trackTintColor = [UIColor clearColor];
    webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    theProgressView.transform = CGAffineTransformMakeScale(1.0f, 1.50f);
    [self.view addSubview:theProgressView];
    [self.view bringSubviewToFront:theProgressView];
    
    self.urlString = [self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    
    loadingActivietyView.center = CGPointMake(self.view.width/2, self.view.height/2);
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    if (progress == 0.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        theProgressView.progress = 0;
        [UIView animateWithDuration:0.27 animations:^{
            theProgressView.alpha = 1.0;
        }];
    }
    if (progress == 1.0) {
        [loadingActivietyView stopAnimating];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [UIView animateWithDuration:0.27 delay:progress - theProgressView.progress options:0 animations:^{
            theProgressView.alpha = 0.0;
        } completion:nil];
    }
    
    [theProgressView setProgress:progress animated:NO];
}

#pragma  UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    _toolbar.items = [NSArray arrayWithObjects: _backButton, _flexibleSpace, _forwardButton, _flexibleSpace, _reloadButton, nil];
    [self checkNavigationStatus];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [loadingActivietyView stopAnimating];

    _toolbar.items = [NSArray arrayWithObjects: _backButton, _flexibleSpace, _forwardButton, _flexibleSpace, _reloadButton, nil];
    [self checkNavigationStatus];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [loadingActivietyView stopAnimating];
    
    _toolbar.items = [NSArray arrayWithObjects: _backButton, _flexibleSpace, _forwardButton, _flexibleSpace, _reloadButton, nil];
 
    [self checkNavigationStatus];
}


- (void)reload
{
    
    [webView reload];
    
}

- (void)goBack
{
    if (webView.canGoBack == YES) {
        [webView goBack];
        [self checkNavigationStatus];
    }
}

- (void)goForward
{
    if (webView.canGoForward == YES) {
        [webView goForward];
        [self checkNavigationStatus];
    }
}

- (void)checkNavigationStatus
{
    _backButton.enabled = webView.canGoBack;
    _forwardButton.enabled = webView.canGoForward;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    _progressProxy.progressDelegate = nil;
    _progressProxy.webViewProxyDelegate = nil;

    _progressProxy = nil;
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [webView stopLoading];
    webView.delegate = nil;
 
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
