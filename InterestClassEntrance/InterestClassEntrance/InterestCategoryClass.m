//
//  InterestCategoryClass.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/26/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "InterestCategoryClass.h"

@implementation InterestCategoryClass

-(id)init{
    self = [super init];
    if (self) {
        self->columArr[0] = 5;
        self->columArr[1] = 5;
        self->columArr[2] = 4;
        self->columArr[3] = 4;
        
        self.categNameArr = [[NSArray alloc] initWithObjects:@"音乐",@"运动",@"绘画",@"运动", nil];
    }
    return self;
}

-(NSArray *)imgArrayForRowAtIndex:(char)rowIndex{
    if(rowIndex>=0 && rowIndex<INTEREST_CATEGORY_ROW){
        NSMutableArray *imgArr = [[NSMutableArray alloc] init];
        for (int i =0; i<self->columArr[rowIndex]; ++i) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"InterCateg%d_img%d", rowIndex, i]];
            if (img) {
                [imgArr addObject:img];
            }else{
                img = [UIImage imageNamed:@"photo"];
                [imgArr addObject:img];
            }
        }
        return [[NSArray alloc] initWithArray:imgArr];
    }
    return nil;
}

@end