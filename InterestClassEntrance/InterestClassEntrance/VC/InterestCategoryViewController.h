//
//  InterestCategoryViewController
//  HorizontalCollectionCellExample
//
//  Created by Muratcan Celayir on 1.02.2015.
//  Copyright (c) 2015 Muratcan Celayir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterestCategoryClass.h"

@interface InterestCategoryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic)  UICollectionView *collection;
@property(strong, nonatomic) InterestCategoryClass *interestCategInfo;
@property (nonatomic, readonly) UICollectionReusableView *header;

@end


