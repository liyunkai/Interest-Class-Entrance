//
//  CommentData.h
//  InterestClassEntrance
//
//  Created by 邓翔 on 15/4/8.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentData : NSObject

@property NSString *name;
@property NSDate *date;
@property NSString *comment;

- (id)initWithName:(NSString*)name
              date:(NSDate*)date
           comment:(NSString*)comment;

- (NSString*)getFormatedDate;

@end
