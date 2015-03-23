//
//  QuestionsViewController.h
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionView.h"
#import "readDatabase.h"

@interface QuestionsViewController : UIViewController <UIGestureRecognizerDelegate>

@property(nonatomic, retain) QuestionView *visitedView;
@property(nonatomic, retain) QuestionView *preView;
@property(nonatomic, retain) QuestionView *nextView;

@property(strong,nonatomic) NSMutableArray *subject_o;
@property(strong,nonatomic) readDatabase *haha;
@property(assign,nonatomic) int index;

@end


