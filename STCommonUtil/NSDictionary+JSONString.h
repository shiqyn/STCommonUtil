//
//  NSDictionary+JSONString.h
//  STCommonUtilDemo
//
//  Created by shiqyn on 21/5/15.
//  Copyright (c) 2015年 Shiqyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONString)
-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint;
@end
