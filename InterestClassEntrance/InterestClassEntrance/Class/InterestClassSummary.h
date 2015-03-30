//
//  InterestClassSummary.h
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/30/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface InterestClassSummary : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger signingNum;
@property(nonatomic,assign)NSInteger commentNum;
@property(nonatomic,strong)UIImage *headImage;
@property(nonatomic,assign)NSInteger price;
@property(nonatomic,strong)NSString *certification;
@property(nonatomic,strong)NSString *address;

-(id)init;

@end
