//
//  XGZLDetailWebViewCtrl.h
//  FJFXT-PhaseII
//
//  Created by shiqyn on 14-6-21.
//  Copyright (c) 2014年 istrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "NJKWebViewProgress.h"
#import <FrameAccessor.h>

@interface STWebViewController : BaseViewController<UIWebViewDelegate,NJKWebViewProgressDelegate>
{
    NSString* urlString;
    UIWebView* webView;
    
    
    
    
 
    UIActivityIndicatorView* loadingActivietyView;
    
    UIToolbar *_toolbar;
    UIBarButtonItem *_actionButton;
    UIBarButtonItem *_reloadButton;
    UIBarButtonItem *_loadingButton;
    UIBarButtonItem *_forwardButton;
    UIBarButtonItem *_backButton;
    UIBarButtonItem *_flexibleSpace;
}

@property(nonatomic, strong)UIProgressView* theProgressView;
@property(nonatomic, copy)NSString* urlString;
@end
