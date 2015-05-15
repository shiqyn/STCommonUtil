//
//  BaseViewController.m
//  STCommonUtilDemo
//
//  Created by shiqyn on 15/5/15.
//  Copyright (c) 2015年 Shiqyn. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
@synthesize titleLabel;

-(id)init
{
    if(self = [super init])
    {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor =[UIColor whiteColor];//kDefaultTextColor;
        titleLabel.numberOfLines= 2;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.titleView = titleLabel;
    
}


-(void)showLoadingHUDWithInfoString:(NSString*)infostring
{
    if(!tipHub)
        tipHub = [[MBProgressHUD alloc] initWithView:self.view ];
    
    if([self.view.subviews indexOfObject:tipHub] == NSNotFound)
        [self.view addSubview:tipHub];
    
    
    tipHub.mode = MBProgressHUDModeCustomView;
    UIActivityIndicatorView* activityView =     [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityView startAnimating];
    tipHub.customView = activityView;
    tipHub.labelText = infostring;
    tipHub.userInteractionEnabled  =NO;
    tipHub.animationType = MBProgressHUDAnimationZoomOut;
    
    [tipHub show:YES];
    
   

    
}
-(void)hideLoadingHUD
{
    [tipHub hide:YES];
}
-(void)showErrHUDWithMsg:(NSString*)msgString  hideAfter:(int)hideSecond
{
    if(!tipHub)
        tipHub = [[MBProgressHUD alloc] initWithView:self.view];
    
    if([self.view.subviews indexOfObject:tipHub] == NSNotFound)
        [self.view addSubview:tipHub];
    
    tipHub.mode = MBProgressHUDModeCustomView;
    tipHub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-error.png"]];
    tipHub.labelText = msgString;
    tipHub.animationType = MBProgressHUDAnimationZoomIn;
    [tipHub show:YES];
    tipHub.userInteractionEnabled  =NO;
    
    if(hideSecond>=0)
        [tipHub hide:YES afterDelay:hideSecond];
}

-(void)hideTipHUD
{
    [tipHub hide:YES];
}

-(void)showInfoHUDWithMsg:(NSString*)msgString hideAfter:(int)hideSecond
{
    if(!tipHub)
        tipHub = [[MBProgressHUD alloc] initWithView:self.view];
    
    if([self.view.subviews indexOfObject:tipHub] == NSNotFound)
        [self.view addSubview:tipHub];
    
    tipHub.userInteractionEnabled  =NO;
    tipHub.mode = MBProgressHUDModeCustomView;
    tipHub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-info.png"]];
    tipHub.labelText = msgString;
    tipHub.animationType = MBProgressHUDAnimationZoomIn;
    [tipHub show:YES];
    
    
    if(hideSecond>=0)
        [tipHub hide:YES afterDelay:hideSecond];
}

-(void)showInfoHUDWithMsg:(NSString*)msgString
{
    [self showInfoHUDWithMsg:msgString hideAfter:-1];
}
-(void)showAlertViewWithMsg:(NSString*)msg{
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:nil
                                                 message:msg
                                                delegate:nil
                                       cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [av show];
}



@end
