//
//  NSDictionary(Utility).m
//  SLFZZX
//
//  Created by shiqyn on 13-2-17.
//  Copyright (c) 2013年 shiqyn. All rights reserved.
//

#import "NSDictionary+Util.h"

@implementation NSDictionary(Utility)
- (id)objectForKeyNotNull:(id)key
{
    id object = [self objectForKey:key];
    if(object == [NSNull null])
		return nil;
    
    return  object;
}

@end
