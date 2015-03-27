//
//  InterestCategoryClass.h
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/26/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/* 定义兴趣班分几类，每一类有几个科目 */
#define INTEREST_CATEGORY_ROW 4

@interface InterestCategoryClass : NSObject{
    char columArr[INTEREST_CATEGORY_ROW];
}

@property (nonatomic, strong) NSArray *categNameArr;

-(NSArray *)imgArrayForRowAtIndex:(char)rowIndex;


@end
