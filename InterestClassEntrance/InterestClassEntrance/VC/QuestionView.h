//
//  QuestionView.h
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/18/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "dataSou.h"

@protocol QuestionViewBtnIndexDelegate

@required
- (void)handleBtnIndex:(NSInteger)btnIndex;

@end

@interface QuestionView : UIView

@property (nonatomic, assign) id<QuestionViewBtnIndexDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *labelQuiz;
@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UILabel *labelC;
@property (weak, nonatomic) IBOutlet UILabel *labelD;

@property (weak, nonatomic) IBOutlet UIImageView *labelAImgView;
@property (weak, nonatomic) IBOutlet UIImageView *labelBImgView;
@property (weak, nonatomic) IBOutlet UIImageView *labelCImgView;
@property (weak, nonatomic) IBOutlet UIImageView *labelDImgView;



- (void)configQuestion:(dataSou *)question btnIndex:(int)btnIndex;
- (void)viewSelectedAtIndex:(NSInteger)index;
- (void)awakeFromNib;
- (IBAction)touchDown:(id)sender;



@end
