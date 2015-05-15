//
//  iniConfigRead.m
//  iniConfigReadDemo
//
//  Created by shiqyn on 11-9-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iniConfigReader.h"

#define COMMENT_CHAR ';'
void trim(char *s);

void trim(char *s)
{
	char *p,*q;
	for(p=s;*p==' ';p++);
	for(q=s+strlen(s)-1;*q==' ';q--);
	if(p==s)
		*++q='\0';
	else
	{
		while(p<=q)
			*s++=*p++;
		*s='\0';
	}
}

@implementation iniConfigReader

+(NSString*)getValueInSection:(NSString*)group withKey:(NSString*)key
{
	
	char* group_start = NULL;
	char* matchSection = NULL;
	
	NSString* filePath =  [[NSBundle mainBundle] pathForResource:@"url.ini" ofType:nil inDirectory:@"ini"];
	NSString* fileDataStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	
	NSAssert(fileDataStr != nil, @"iniConfigReader file data is nil");
	
	//NSLog(@"fileDataStr:%@", fileDataStr);
	
	char* pStr = (char*)[fileDataStr UTF8String];
	enum _state
	{
		STAT_NONE = 0,
		STAT_GROUP,
		STAT_GROUP_MATCH_BEGIN,
		STAT_GROUP_MATCH_END,
		STAT_COMMENT
	}state = STAT_NONE;
	
	char*p;
	BOOL isFindMatchedSetion = NO;
	for(p = pStr; *p != '\0' && p!=NULL; p++)
	{
		switch(state)
		{
			case STAT_NONE:
			{
				if(*p == '[')
				{
					/*在“空白”状态下，读入字符‘[’，进入“分组组名”状态。*/
					state = STAT_GROUP;
					group_start = p + 1;
				}
				else if(*p == COMMENT_CHAR)
				{
					/*在“空白”状态下，读入字符‘#’，进入“注释”状态。*/
					state = STAT_COMMENT;
				}
				
				break;
			}
			case STAT_GROUP:
			{
				
				if(*p == ']')
				{
					*p = '\0';
					trim(group_start);
					if(strcmp(group_start, [group UTF8String]) == 0)
					{
						matchSection = p+1;
						state = STAT_GROUP_MATCH_BEGIN;
					}
					else 
						state = STAT_NONE;
				}
				break;
			}
			case STAT_GROUP_MATCH_BEGIN:
			{
				if(*p == '[' || *p == '\0')
				{
					*p = '\0';
					isFindMatchedSetion = YES; 
				}
				
				break;
				
			}
			case STAT_COMMENT:
			{
				/*在“注释”状态下，读入换行字符，结束“注释”状态，回到“空白”状态。*/
				if(*p == '\n')
				{
					state = STAT_NONE;
					break;
				}
				break;
			}
				
			default:break;
		}
		
		if(isFindMatchedSetion)
			break;
	}
	//-------------------
	
	enum _state2
	{
		STAT_MATCH_NONE = 0,
		STAT_KEY,
		STAT_KEY_MATCH,
		STAT_VALUE,
		STAT_MATCH_COMMENT
	}matchSectionState = STAT_MATCH_NONE;
	
	char* key_start   = NULL;
	char* value_start = NULL;
	
	if(matchSection == NULL)
		return nil;
	
	else 
	{ 
		
		for(p = matchSection; *p != '\0' && p!=NULL; p++)
		{ 
			
			switch(matchSectionState)
			{
				case STAT_MATCH_NONE:
				{ 
					if(*p == COMMENT_CHAR)
					{
						/*在“空白”状态下，读入字符‘;’，进入“注释”状态。*/
						matchSectionState = STAT_MATCH_COMMENT;
					}
					else if(!isspace(*p))
					{
						/*在“空白”状态下，读入非空白字符，进入“配置项的名称”状态。*/
						matchSectionState = STAT_KEY;
						key_start = p;
					}
					break;
				}
					
				case STAT_MATCH_COMMENT:
				{
					/*在“注释”状态下，读入换行字符，结束“注释”状态，回到“空白”状态。*/
					if(*p == '\n' || *p == '\r')
					{
						matchSectionState = STAT_MATCH_NONE;
						break;
					}
					break;
				}
				case STAT_KEY:
				{
					/*在“配置项的名称”状态下，读入字符‘=’， 配置项的名称解析成功，进入“配置项的值”状态。*/
					if(*p == '='  )
					{
						*p = '\0';
						
						trim(key_start);
						if(strcmp(key_start, [key UTF8String]) == 0)
						{
							matchSectionState = STAT_KEY_MATCH;
							value_start = p + 1;
						}
						else 
							matchSectionState = STAT_VALUE;
						
						
					}
					break;
				}
				case STAT_VALUE:
				{
					if(*p == '\r' || *p == '\n')
						matchSectionState = STAT_MATCH_NONE;
					
					break;
				}
				case STAT_KEY_MATCH:
				{
					if(*p == '\n' || *p == '\r')
					{
						*p = '\0';
						matchSectionState = STAT_MATCH_NONE;
						trim(value_start);
						
						return [NSString stringWithUTF8String:value_start];
					}
					break;
				}
				default:break;
			}
			
		}
	}
	
	if(matchSectionState == STAT_KEY_MATCH)
	{
		trim(value_start);
		return [NSString stringWithUTF8String:value_start];
	}
	
	return nil;
	
}
@end
