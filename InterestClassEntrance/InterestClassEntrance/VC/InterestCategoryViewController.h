//
//  InterestCategoryViewController
//  HorizontalCollectionCellExample
//
//  Created by Muratcan Celayir on 1.02.2015.
//  Copyright (c) 2015 Muratcan Celayir. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 定义兴趣班分几类，每一类有几个科目 */
#define INTEREST_CATEGORY_ROW        4
@interface InterestCategoryClass : NSObject{
    char columArr[INTEREST_CATEGORY_ROW];
}

-(NSArray *)imgArrayForRowAtIndex:(char)rowIndex;

@end

@interface InterestCategoryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property(strong, nonatomic) InterestCategoryClass *interestCategInfo;

@end


