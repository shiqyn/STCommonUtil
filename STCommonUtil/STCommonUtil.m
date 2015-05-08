//
//  STCommonUtil.m
//  STCommonUtilDemo
//
//  Created by shiqyn on 8/5/15.
//  Copyright (c) 2015年 Shiqyn. All rights reserved.
//

#import "STCommonUtil.h"

@implementation STCommonUtil
+(UILabel*)createLabelWithFrame:(CGRect)frm font:(UIFont*) font textColor:(UIColor*)textColor
{
    UILabel* label = [[UILabel alloc] initWithFrame:frm];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    label.font = font;
    
    return label;
}

@end
