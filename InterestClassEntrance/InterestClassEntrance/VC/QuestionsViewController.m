//
//  QuestionsViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#define TABLEBAME  @"quizEysenck"

#import "QuestionsViewController.h"

@interface QuestionsViewController ()

{
     sqlite3 *db;
}

@property(nonatomic, assign) int seq;
@property (weak, nonatomic) IBOutlet UIView *progressBarbg;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;


@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
    self.seq = 1;
    [self loadViewsData];
}

#pragma mark -- Data Proc

-(void)loadViewsData{
    [self loadVisitedViewData];
    if (self.seq!=1) {
        [self loadPreViewData];
    }
    if (self.seq!=10) {
        [self loadNextViewData];
    }
    [self loadProgressBarData];
    
    ////////
    self.haha = [[readDatabase alloc] init];
    db = [self.haha openDatabase];
    self.haha.subject = [self.haha getTablebyName:db :(NSString *)TABLEBAME];
    
    dataSou *pp0 = [self.haha.subject objectAtIndex:0];
    dataSou *pp1  =  [self.haha getNextQuiz:self.index];
    dataSou *pp2  =  [self.haha getNextQuiz:self.index];
    dataSou *pp3  =  [self.haha getNextQuiz:self.index];
    NSLog(@"subject:%@",pp0.item);
    NSLog(@"subject:%@",pp1.item);
    NSLog(@"subject:%@",pp2.item);
    NSLog(@"subject:%@",pp3.item);
}

- (void)loadPreViewData{
    self.preView.labelA.text = [NSString stringWithFormat:@"%d",self.seq-1];
}

- (void)loadNextViewData{
    self.nextView.labelA.text = [NSString stringWithFormat:@"%d",self.seq+1];
}

- (void)loadVisitedViewData{
    self.visitedView.labelA.text = [NSString stringWithFormat:@"%d",self.seq];
}

- (void)loadProgressBarData{
    self.progressLabel.text = [NSString stringWithFormat:@"%d/10",self.seq];
    [self.progressBar setProgress:self.seq/10.0f animated:YES];
}

#pragma mark -- UI proc

- (void)setUI{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    panGesture.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:panGesture];

    CGRect visitedFrame = [UIScreen mainScreen].bounds;
    self.visitedView = [[QuestionView alloc] initWithFrame:visitedFrame];
    [self.visitedView awakeFromNib];
    self.nextView = [[QuestionView alloc] initWithFrame:CGRectMake(visitedFrame.origin.x + visitedFrame.size.width, visitedFrame.origin.y, visitedFrame.size.width, visitedFrame.size.height)];
    [self.nextView awakeFromNib];
    [self.view addSubview:self.visitedView];
    [self.view addSubview:self.nextView];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    [self moveViewWithTranslation:translation];
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGFloat screenWidth_2 = [UIScreen mainScreen].bounds.size.width/2.0f;
        if (translation.x < -screenWidth_2) {//手势平移超过一半，进入下一题
            if (self.seq == 10) {
                [[[UIAlertView alloc] initWithTitle:nil message:@"这是最后一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
                [self resetView];
                return;
            }
            [self nextQuestionProc];//异步的
        }
        else if( translation.x > screenWidth_2 )
        {//回到上一题
            if (self.seq == 1) {
                [[[UIAlertView alloc] initWithTitle:nil message:@"这是第一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
                [self resetView];
                return;
            }
            [self preQuestionProc];//异步的
        }
        else
        {//复位
            [self resetView];//异步的
        }
    }
}

- (void) moveViewWithTranslation:(CGPoint)translation{
    if(self.seq != 1 ) {
        self.preView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
    }
    if (self.seq != 10) {
        self.nextView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
    }
    self.visitedView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
}

- (void) nextQuestionProc{
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
            [self relocateViewsAfterStep];
            
            self.seq = self.seq+1;
            [self loadNextViewData];
            
            if (self.seq == 10) {
                [self.nextView removeFromSuperview];
                self.nextView = nil;
            }
            [self loadProgressBarData];
            [self.view bringSubviewToFront:self.progressBarbg];
        }
    }];
}

- (void) preQuestionProc{
    [UIView animateWithDuration:0.5f animations:^{
        self.visitedView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        self.preView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        if (self.seq == 10) {
            self.nextView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            QuestionView *dequeueQuestionView;
            if (self.seq==10) {
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
            [self relocateViewsAfterStep];
            
            self.seq = self.seq-1;
            [self loadPreViewData];
            
            if (self.seq == 1) {
                [self.preView removeFromSuperview];
                self.preView = nil;
            }
            [self loadProgressBarData];
            [self.view bringSubviewToFront:self.progressBarbg];
        }
    }];
}

- (void)relocateViewsAfterStep{
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
    if (self.seq != 10) {
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
