//
//  InterestClassSummary.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/30/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "InterestClassSummary.h"

@implementation InterestClassSummary

-(id)initWithName:(NSString *)name SigNum:(NSInteger)sigNum commentNum:(NSInteger)commentNum headImage:(UIImage *)img price:(NSInteger)price certification:(NSString *)certification address:(NSString *)address{
    self = [super init];
    if (self) {
        self.name = [[NSString alloc] initWithString:name];
        self.signingNum = sigNum;
        self.commentNum = commentNum;
        self.headImage = img;
        self.price = price;
        self.certification = [[NSString alloc] initWithString:certification];
        self.address = [[NSString alloc] initWithString:address];
    }
    return self;
}

@end
