//
//  QuestionsViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "QuestionsViewController.h"

@interface QuestionsViewController ()

@property(nonatomic, assign) int seq;

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    panGesture.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:panGesture];
    
    self.seq = 1;
    CGRect visitedFrame = [UIScreen mainScreen].bounds;
    self.visitedView = [[QuestionView alloc] initWithFrame:visitedFrame];
    [self.visitedView awakeFromNib];
    self.nextView = [[QuestionView alloc] initWithFrame:CGRectMake(visitedFrame.origin.x + visitedFrame.size.width, visitedFrame.origin.y, visitedFrame.size.width, visitedFrame.size.height)];
    [self.nextView awakeFromNib];
    [self.view addSubview:self.visitedView];
    [self.view addSubview:self.nextView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self fuzhi];
}

-(void)fuzhi{
    self.visitedView.labelA.text = [NSString stringWithFormat:@"%d",self.seq];
    if (self.seq!=1) {
        self.preView.labelA.text = [NSString stringWithFormat:@"%d",self.seq-1];
    }
    if (self.seq!=100) {
        self.nextView.labelA.text = [NSString stringWithFormat:@"%d",self.seq+1];
    }
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    [self moveViewWithTranslation:translation];
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGFloat screenWidth_2 = [UIScreen mainScreen].bounds.size.width/2.0f;
        if (translation.x < -screenWidth_2) {//手势平移超过一半，进入下一题
            if (self.seq == 100) {
                [[[UIAlertView alloc] initWithTitle:nil message:@"这是最后一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
                [self resetView];
                return;
            }
            [self nextQuestionViewState];
        }
        else if( translation.x > screenWidth_2 )
        {//回到上一题
            if (self.seq == 1) {
                [[[UIAlertView alloc] initWithTitle:nil message:@"这是第一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
                [self resetView];
                return;
            }
            [self preQuestionViewState];
        }
        else
        {//复位
            [self resetView];
        }
        [self fuzhi];
    }
}

- (void) moveViewWithTranslation:(CGPoint)translation{
    if(self.seq != 1 ) {
           self.preView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
    }
    if (self.seq != 100) {
        self.nextView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
    }
    self.visitedView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
}

- (void) nextQuestionViewState{
    [UIView animateWithDuration:0.5f animations:^{
        self.visitedView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        self.nextView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        if (self.seq == 1) {
            self.preView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            QuestionView *dequeueQuestionView;
            if (self.seq==1) {
                dequeueQuestionView = [[QuestionView alloc] init];
                [dequeueQuestionView awakeFromNib];
                [self.view addSubview:dequeueQuestionView];
            }else{
                dequeueQuestionView = self.preView;
            }
            self.preView = self.visitedView;
            self.visitedView = self.nextView;
            self.nextView = nil;
            self.nextView = dequeueQuestionView;
            [self adjustViewAfterStep];
            
            self.seq = self.seq+1;
            if (self.seq == 100) {
                [self.nextView removeFromSuperview];
                self.nextView = nil;
            }
        }
    }];
}

- (void) preQuestionViewState{
    [UIView animateWithDuration:0.5f animations:^{
        self.visitedView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        self.preView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        if (self.seq == 100) {
            self.nextView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            QuestionView *dequeueQuestionView;
            if (self.seq==100) {
                dequeueQuestionView = [[QuestionView alloc] init];
                [dequeueQuestionView awakeFromNib];
                [self.view addSubview:dequeueQuestionView];
            }else{
                dequeueQuestionView = self.nextView;
            }
            self.nextView = self.visitedView;
            self.visitedView = self.preView;
            self.preView = nil;
            self.preView = dequeueQuestionView;
            [self adjustViewAfterStep];
            
            self.seq = self.seq-1;
            if (self.seq == 1) {
                [self.preView removeFromSuperview];
                self.preView = nil;
            }
        }
    }];
}

- (void)adjustViewAfterStep{
    [self.preView removeFromSuperview];
    self.preView.transform = CGAffineTransformIdentity;
    self.preView.frame = CGRectMake([UIScreen mainScreen].bounds.origin.x - [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.origin.y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.preView];
    
    [self.visitedView removeFromSuperview];
    self.visitedView.transform = CGAffineTransformIdentity;
    self.visitedView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.visitedView];
    
    [self.nextView removeFromSuperview];
    self.nextView.transform = CGAffineTransformIdentity;
    self.nextView.frame = CGRectMake([UIScreen mainScreen].bounds.origin.x+[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.origin.y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.nextView];

    
}

- (void) resetView{
    [UIView beginAnimations:@"resetView" context:nil];
    [UIView setAnimationDuration:1];
    if (self.seq != 1) {
        self.preView.transform = CGAffineTransformIdentity;
    }
    if (self.seq != 100) {
        self.nextView.transform = CGAffineTransformIdentity;
    }
    self.visitedView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
