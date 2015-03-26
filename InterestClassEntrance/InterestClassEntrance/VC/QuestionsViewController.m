//
//  QuestionsViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#define TABLEBAME_EYSENCK  @"quizEysenck"
#define TABLENAME_TALENT   @"quizTalent"

#import "QuestionsViewController.h"
#import "ReportViewController.h"

@interface QuestionsViewController ()

@property (weak, nonatomic) IBOutlet UIView *progressBarbg;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;


@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
    [self initViewsData];
}

#pragma mark -- Data Proc

- (void)handleBtnIndex:(NSInteger)btnIndex{
    self->choises[self.quiz.index0] = (int)btnIndex;
}

-(void)initViewsData{
    self.quiz = [[readDatabase alloc] init];
    self.quiz.subject = [self.quiz getTablebyName :(NSString *)TABLENAME_TALENT];
    //配置题目开始题数
    int seqInit;
    seqInit = 1;
    self.quiz.index0 = seqInit-1;
    //配置用户已选信息
    for (int i=0; i<100; ++i) {
        self->choises[i] = -1;
    }
    //
    [self loadProgressBarData];
    [self.visitedView configQuestion:[self.quiz getCurrentQuiz] btnIndex:self->choises[self.quiz.index0]];
    [self.preView configQuestion:[self.quiz getRandQuiz:self.quiz.index0-1] btnIndex:self->choises[self.quiz.index0-1]];
    [self.nextView configQuestion:[self.quiz getRandQuiz:self.quiz.index0+1] btnIndex:self->choises[self.quiz.index0+1]];
}

- (void)loadProgressBarData{
    self.progressLabel.text = [NSString stringWithFormat:@"%d/%ld",self.quiz.index0+1, (long)self.quiz.amount];
    [self.progressBar setProgress:(float)(self.quiz.index0+1)/self.quiz.amount animated:YES];
    [self.view bringSubviewToFront:self.progressBarbg];
}

- (void)loadPreViewData{
    dataSou *question = [self.quiz getLastQuiz];
    [self.visitedView configQuestion:question btnIndex:self->choises[self.quiz.index0]];
    [self.preView configQuestion:[self.quiz getRandQuiz:self.quiz.index0-1] btnIndex:self->choises[self.quiz.index0-1]];
}

- (void)loadNextViewData{
    dataSou *question = [self.quiz getNextQuiz];
    [self.visitedView configQuestion:question btnIndex:self->choises[self.quiz.index0]];
    [self.nextView configQuestion:[self.quiz getRandQuiz:self.quiz.index0+1] btnIndex:self->choises[self.quiz.index0+1]];
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
    self.visitedView.delegate = self;
    self.nextView = [[QuestionView alloc] initWithFrame:CGRectMake(visitedFrame.origin.x + visitedFrame.size.width, visitedFrame.origin.y, visitedFrame.size.width, visitedFrame.size.height)];
    [self.nextView awakeFromNib];
    self.nextView.delegate = self;
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
            if (self.quiz.index0+1 == self.quiz.amount) {
                [[[UIAlertView alloc] initWithTitle:nil message:@"这是最后一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
                [self resetView];
                return;
            }
            [self nextQuestionProc];//异步的
        }
        else if( translation.x > screenWidth_2 )
        {//回到上一题
            if (self.quiz.index0 == 0) {
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
    if(self.quiz.index0 != 0 ) {
        self.preView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
    }
    if (self.quiz.index0+1 != self.quiz.amount) {
        self.nextView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
    }
    self.visitedView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
}

- (void) nextQuestionProc{
    [UIView animateWithDuration:0.5f animations:^{
        self.visitedView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        self.nextView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        if (self.quiz.index0 == 0) {
            self.preView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            QuestionView *dequeueQuestionView;
            if (self.quiz.index0==0) {
                dequeueQuestionView = [[QuestionView alloc] init];
                [dequeueQuestionView awakeFromNib];
                dequeueQuestionView.delegate = self;
                [self.view addSubview:dequeueQuestionView];
            }else{
                dequeueQuestionView = self.preView;
            }
            self.preView = self.visitedView;
            self.visitedView = self.nextView;
            self.nextView = nil;
            self.nextView = dequeueQuestionView;
            [self relocateViewsAfterStep];
            
            [self loadNextViewData];
            [self loadProgressBarData];
            
            if (self.quiz.index0+1 == self.quiz.amount) {
                [self.nextView removeFromSuperview];
                self.nextView = nil;
            }
        }
    }];
}

- (void) preQuestionProc{
    [UIView animateWithDuration:0.5f animations:^{
        self.visitedView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        self.preView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        if (self.quiz.index0+1 == self.quiz.amount) {
            self.nextView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            QuestionView *dequeueQuestionView;
            if (self.quiz.index0+1==self.quiz.amount) {
                dequeueQuestionView = [[QuestionView alloc] init];
                [dequeueQuestionView awakeFromNib];
                dequeueQuestionView.delegate = self;
                [self.view addSubview:dequeueQuestionView];
            }else{
                dequeueQuestionView = self.nextView;
            }
            self.nextView = self.visitedView;
            self.visitedView = self.preView;
            self.preView = nil;
            self.preView = dequeueQuestionView;
            [self relocateViewsAfterStep];
            
            [self loadPreViewData];
            [self loadProgressBarData];
            
            if (self.quiz.index0 == 0) {
                [self.preView removeFromSuperview];
                self.preView = nil;
            }
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
    [UIView setAnimationDuration:0.5f];
    if (self.quiz.index0 != 0) {
        self.preView.transform = CGAffineTransformIdentity;
    }
    if (self.quiz.index0+1 != self.quiz.amount) {
        self.nextView.transform = CGAffineTransformIdentity;
    }
    self.visitedView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (IBAction)quitTest:(id)sender {
    UIAlertView *quitAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您确定结束测试吗？\n您的测试进度将被保存" delegate:self cancelButtonTitle:@"继续测试" otherButtonTitles:@"结束测试", nil];
    [quitAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {//go on
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    if (buttonIndex == 0) {//quit
        //做数据保存
    }
}

- (IBAction)completeTest:(id)sender {
    if (self.quiz.index0 == self.quiz.amount-1) {
        [self performSegueWithIdentifier:@"completeTest" sender:sender];
    }else{
        [[[UIAlertView alloc] initWithTitle:nil message:@"请答完全部题后再提交" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
    }
}





// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ReportViewController *desVC = segue.destinationViewController;
    
    desVC.gress = [self.quiz getEvaluatebyScore:self.quiz.subject :choises];
}


@end
