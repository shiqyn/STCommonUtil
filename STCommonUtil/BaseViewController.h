//
//  BaseViewController.h
//  STCommonUtilDemo
//
//  Created by shiqyn on 15/5/15.
//  Copyright (c) 2015年 Shiqyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>


@interface BaseViewController : UIViewController{
    MBProgressHUD* tipHub;
    UILabel* titleLabel;
}
@property(nonatomic, readonly) UILabel* titleLabel;

-(void)showLoadingHUDWithInfoString:(NSString*)infostring;
-(void)showErrHUDWithMsg:(NSString*)msgString  hideAfter:(int)hideSecond;
-(void)showInfoHUDWithMsg:(NSString*)msgString;
-(void)showInfoHUDWithMsg:(NSString*)msgString hideAfter:(int)hideSecond;
-(void)hideTipHUD;
-(void)hideLoadingHUD;


-(void)showAlertViewWithMsg:(NSString*)msg;

@end











