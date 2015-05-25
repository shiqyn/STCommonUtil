//
//  UIButton(Utility).h
//  NBFisheryiPad
//
//  Created by shiqyn on 11-5-3.
//  Copyright 2011 Stongsoft. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <BButton.h>

@interface UIButton(Utility)

+(BButton*)createBButtonWithTitle:(NSString*)title
                             type:(BButtonType)type
                           target:(id)target
                         selector:(SEL)selector
                            frame:(CGRect)frm;


+(UIButton *)moduleButtonWithTitle:(NSString *)title
						  target:(id)target
						selector:(SEL)selector
						   frame:(CGRect)fme
						   image:(UIImage *)image
					imagePressed:(UIImage *)imagePressed
					  textColor:(UIColor*)c;



+(UIButton*) backButtonWith:(NSString*)titles
				backBtnImge:(UIImage*)backButtonImage 
				  highlight:(UIImage*)backButtonHighlightImage 
			   leftCapWidth:(CGFloat)capWidth 
					 target:(id)target 
				   selector:(SEL)selector 
					 navBar:(UINavigationBar*)bar;

+(UIButton *)buttonWithTitle:(NSString *)title
					  target:(id)target
					selector:(SEL)selector
					   frame:(CGRect)fme
					   image:(UIImage *)image
				imagePressed:(UIImage *)imagePressed
				   textColor:(UIColor*)c;

+(UIButton *)buttonWithImageTitle:(NSString *)title
                           target:(id)target
                         selector:(SEL)selector
                            frame:(CGRect)fme
                            image:(UIImage *)image
                     imagePressed:(UIImage *)imagePressed
                        textColor:(UIColor*)c;


+(UIButton *)contactsGroupButtonWithTitle:(NSString *)title
								   target:(id)target
								 selector:(SEL)selector
									frame:(CGRect)fme
									image:(UIImage *)image
							 imagePressed:(UIImage *)imagePressed
								textColor:(UIColor*)c;

+(UIButton*)horizontalButtonWithTitle:(NSString *)title
                               target:(id)target
                             selector:(SEL)selector
                                frame:(CGRect)fme
                                image:(UIImage *)image
                         imagePressed:(UIImage *)imagePressed
                            textColor:(UIColor*)c;

+(UIButton*)horizontalButtonWithTitle2:(NSString *)title
                                target:(id)target
                              selector:(SEL)selector
                                 frame:(CGRect)fme
                                 image:(UIImage *)image
                          imagePressed:(UIImage *)imagePressed
                             textColor:(UIColor*)c;

//+(AXWireButton*)wireButtonWithTitle:(NSString *)title
//                             target:(id)target
//                           selector:(SEL)selector
//                              frame:(CGRect)fme
//                          textColor:(UIColor*)c
//                           textFont:(UIFont*)font;

@end










