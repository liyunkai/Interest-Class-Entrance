//
//  CommentData.m
//  InterestClassEntrance
//
//  Created by 邓翔 on 15/4/8.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import "CommentData.h"

@implementation CommentData

- (id)initWithName:(NSString*)name date:(NSDate*)date comment:(NSString*)comment {
    self = [super init];
    if(self){
        self.name = name;
        self.date = date;
        self.comment = comment;
    }
    return self;
}

- (NSString*)getFormatedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeInterval aDay = 24*60*60, aYear = 365*24*60*60;
    
    if([self.date compare:[[NSDate date] dateByAddingTimeInterval:-aDay]] == NSOrderedDescending){
        //一天内的评论
        [dateFormatter setDateFormat:@"HH:mm"];
    } else if([self.date compare:[[NSDate date] dateByAddingTimeInterval:-aYear]] == NSOrderedDescending) {
        //一年内的评论
        [dateFormatter setDateFormat:@"MM-dd"];
    } else {
        //更早的评论
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    return [dateFormatter stringFromDate:self.date];
}

@end
