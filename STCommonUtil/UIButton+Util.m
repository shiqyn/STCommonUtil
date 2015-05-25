//
//  UIButton(Utility).m
//  NBFisheryiPad
//
//  Created by shiqyn on 11-5-3.
//  Copyright 2011 Stongsoft. All rights reserved.
//

#import "UIButton+Util.h"

#define MAX_BACK_BUTTON_WIDTH 160.0

 @implementation UIButton(Utility)

+(BButton*)createBButtonWithTitle:(NSString*)title
                             type:(BButtonType)type
                             font:(UIFont*)fnt
                           target:(id)target
                         selector:(SEL)selector
                            frame:(CGRect)frm{
    BButton* btn = [[BButton alloc] initWithFrame:frm type:type style:BButtonStyleBootstrapV3];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = fnt;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)moduleButtonWithTitle:(NSString *)title
						 target:(id)target
					   selector:(SEL)selector
						  frame:(CGRect)fme
						  image:(UIImage *)image
				   imagePressed:(UIImage *)imagePressed
					  textColor:(UIColor*)c
{	
	
	UIButton *button = [[UIButton alloc] initWithFrame:fme];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];	
	
	[button setTitleColor: c forState:UIControlStateNormal];
	
	
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
	
	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:imagePressed.size.width/2 topCapHeight:imagePressed.size.height/2];
	[button setBackgroundImage:newPressedImage forState:UIControlStateNormal];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button ;
}


+(UIButton *)buttonWithTitle:(NSString *)title
							target:(id)target
						  selector:(SEL)selector
							 frame:(CGRect)fme
							 image:(UIImage *)image
					  imagePressed:(UIImage *)imagePressed
						 textColor:(UIColor*)c
{	
	
	UIButton *button = [[UIButton alloc] initWithFrame:fme];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];	
	
	[button setTitleColor: c forState:UIControlStateNormal];
	
	if(image)
    {
		UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
		[button setBackgroundImage:newImage forState:UIControlStateNormal];
    }
	
    if(imagePressed)
    {
		UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:imagePressed.size.width/2 topCapHeight:imagePressed.size.height/2];
		[button setBackgroundImage:newPressedImage forState:UIControlStateNormal/*UIControlStateHighlighted*/];
    }
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button ;
}
+(UIButton *)buttonWithImageTitle:(NSString *)title
                           target:(id)target
                         selector:(SEL)selector
                            frame:(CGRect)fme
                            image:(UIImage *)image
                     imagePressed:(UIImage *)imagePressed
                        textColor:(UIColor*)c
{
	
	UIButton *button = [[UIButton alloc] initWithFrame:fme];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];
	
	[button setTitleColor: c forState:UIControlStateNormal];
	
	
    //	UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
	[button setImage:image forState:UIControlStateNormal];
	
    //	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:imagePressed.size.width/2 topCapHeight:imagePressed.size.height/2];
	[button setImage:imagePressed forState:UIControlStateNormal/*UIControlStateHighlighted*/];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button ;
}


+(UIButton*) backButtonWith:(NSString*)titles
				backBtnImge:(UIImage*)backButtonImage 
				  highlight:(UIImage*)backButtonHighlightImage 
			   leftCapWidth:(CGFloat)capWidth 
					 target:(id)target 
				   selector:(SEL)selector 
					 navBar:(UINavigationBar*)bar
{
	
	// Create stretchable images for the normal and highlighted states
	UIImage* buttonImage = [backButtonImage stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0];
	UIImage* buttonHighlightImage = [backButtonHighlightImage stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0];
	
	// Create a custom button
	UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	
	// Set the title to use the same font and shadow as the standard back button
	backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
	backBtn.titleLabel.textColor = [UIColor whiteColor];
	backBtn.titleLabel.shadowOffset = CGSizeMake(0,-1);
	backBtn.titleLabel.shadowColor = [UIColor darkGrayColor];
	
	// Set the break mode to truncate at the end like the standard back button
	backBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	
	// Inset the title on the left and right
	backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 8.0, 0, 3.0);
	
	// Make the button as high as the passed in image
	backBtn.frame = CGRectMake(0, 0, 0, buttonImage.size.height);
	
	// Just like the standard back button, use the title of the previous item as the default back text
	//[navBar setText:navBar.topItem.title onBackButton:button];
	// Measure the width of the text
	
	CGSize textSize = [titles sizeWithFont:backBtn.titleLabel.font];
	// Change the button's frame. The width is either the width of the new text or the max width
	backBtn.frame = CGRectMake(backBtn.frame.origin.x, backBtn.frame.origin.y, 
							   (textSize.width + (capWidth * 0.7)) > MAX_BACK_BUTTON_WIDTH ? MAX_BACK_BUTTON_WIDTH : (textSize.width + (capWidth * 0.7)), 
							   backBtn.frame.size.height);
	
	// Set the text on the button
	[backBtn setTitle:titles forState:UIControlStateNormal];
	
	// Set the stretchable images as the background for the button
	[backBtn setBackgroundImage:buttonImage forState:UIControlStateNormal];
	[backBtn setBackgroundImage:buttonHighlightImage forState:UIControlStateHighlighted];
	[backBtn setBackgroundImage:buttonHighlightImage forState:UIControlStateSelected];
	
	// Add an action for going back
	[backBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
	return backBtn;
}


+(UIButton *)contactsGroupButtonWithTitle:(NSString *)title
						 target:(id)target
					   selector:(SEL)selector
						  frame:(CGRect)fme
						  image:(UIImage *)image
				   imagePressed:(UIImage *)imagePressed
					  textColor:(UIColor*)c
{	
	
	UIButton *button = [[UIButton alloc] initWithFrame:fme];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];	
	
	[button setTitleColor: c forState:UIControlStateNormal];
	
	
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
	
	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:imagePressed.size.width/2 topCapHeight:imagePressed.size.height/2];
	[button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button ;
}

+(UIButton*)horizontalButtonWithTitle:(NSString *)title
                               target:(id)target
                             selector:(SEL)selector
                                frame:(CGRect)fme
                                image:(UIImage *)image
                         imagePressed:(UIImage *)imagePressed
                            textColor:(UIColor*)c
{
    UIButton *button = [[UIButton alloc] initWithFrame:fme];
    // or you can do this:
    //		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    

    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor: c forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [button setImage:image forState:UIControlStateNormal];
    
//    [button setBackgroundImage:image forState:UIControlStateNormal/*UIControlStateHighlighted*/];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // in case the parent view draws with a custom color or gradient, use a transparent color
    button.backgroundColor = [UIColor clearColor];
    
    return button ;
}

//+(AXWireButton*)wireButtonWithTitle:(NSString *)title
//                             target:(id)target
//                           selector:(SEL)selector
//                              frame:(CGRect)fme
//                          textColor:(UIColor*)c
//                           textFont:(UIFont*)font
//{
//    
//    AXWireButton *button = [[AXWireButton alloc] initWithFrame:fme];
// 
//    [button setTitle:title forState:UIControlStateNormal];
//    
//    [button setTitleColor: c forState:UIControlStateNormal];
//    
//
//    
//    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    
//    // in case the parent view draws with a custom color or gradient, use a transparent color
//    button.backgroundColor = [UIColor clearColor];
//    button.titleLabel.font = font;
//    
////    [button bk_addEventHandler:^(id sender){
//        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//        scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.96f, 0.96f)];
//        [button.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
////    }forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
////    
////    [button bk_addEventHandler:^(id sender){
//        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//        scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
//        scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
//        scaleAnimation.springBounciness = 18.0f;
//        [button.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
////    }forControlEvents:UIControlEventTouchUpInside];
////    
////    [button bk_addEventHandler:^(id sender){
////        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
////        scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
////        [button.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
////    }forControlEvents:UIControlEventTouchDragExit];
//    return button ;
//}


+(UIButton*)horizontalButtonWithTitle2:(NSString *)title
                               target:(id)target
                             selector:(SEL)selector
                                frame:(CGRect)fme
                                image:(UIImage *)image
                         imagePressed:(UIImage *)imagePressed
                            textColor:(UIColor*)c
{
    UIButton *button = [[UIButton alloc] initWithFrame:fme];
    // or you can do this:
    //		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor: c forState:UIControlStateNormal];

    
    
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateHighlighted];
    //    [button setBackgroundImage:image forState:UIControlStateNormal/*UIControlStateHighlighted*/];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // in case the parent view draws with a custom color or gradient, use a transparent color
    button.backgroundColor = [UIColor clearColor];
    
    return button ;
}
 


@end





