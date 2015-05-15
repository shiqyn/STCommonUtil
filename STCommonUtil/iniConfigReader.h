//
//  iniConfigRead.h
//  iniConfigReadDemo
//
//  Created by shiqyn on 11-9-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//Current Version1.0
//(20110915创建)
//

#import <Foundation/Foundation.h>


@interface iniConfigReader : NSObject {

}

+(NSString*)getValueInSection:(NSString*)section withKey:(NSString*)key;

@end
