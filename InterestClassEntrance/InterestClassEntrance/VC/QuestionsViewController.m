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
    CGRect visitedFrame = self.view.frame;
    self.visitedView = [[QuestionView alloc] initWithFrame:visitedFrame];
    [self.visitedView awakeFromNib];
    self.nextView = [[QuestionView alloc] initWithFrame:CGRectMake(visitedFrame.origin.x + visitedFrame.size.width, visitedFrame.origin.y, visitedFrame.size.width, visitedFrame.size.height)];
    [self.nextView awakeFromNib];
    [self.view addSubview:self.nextView];
    [self.view addSubview:self.visitedView];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    [self moveViewWithTranslation:translation];
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGFloat screenWidth_2 = [UIScreen mainScreen].bounds.size.width/2.0f;
        if (translation.x < -screenWidth_2) {//手势平移超过一半，进入下一题
            [self nextQuestion];
        }
        else if( translation.x > screenWidth_2 )
        {//回到上一题
            [self nextQuestion];
        }
        else
        {//复位
            [self resetView];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 20)];
            label.text = @"hello world";
            [self.view addSubview:label];
        }
    }
}

- (void) nextQuestion{
    self.seq = self.seq++;
    [UIView beginAnimations:@"nextQuestion" context:nil];
    [UIView setAnimationDuration:1];
    [self moveViewWithTranslation:CGPointMake(self.visitedView.frame.origin.x-self.view.bounds.size.width, 0)];
    [UIView commitAnimations];
    if (self.seq!=1) {
        [self.preView removeFromSuperview];
    }
    self.preView = self.visitedView;
    self.visitedView = self.nextView;
    self.nextView = [[QuestionView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.nextView awakeFromNib];
    [self.view addSubview:self.nextView];
}

- (void) preQuestion{
    self.seq = self.seq--;
    [UIView beginAnimations:@"preQuestion" context:nil];
    [UIView setAnimationDuration:1];
    [self moveViewWithTranslation:CGPointMake(self.view.frame.size.width-self.visitedView.frame.origin.x, 0)];
    [UIView commitAnimations];
    if (self.seq != 100) {
        [self.nextView removeFromSuperview];
    }
    self.nextView = self.visitedView;
    self.visitedView = self.preView;
    self.preView = [[QuestionView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x - self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.preView awakeFromNib];
    [self.view addSubview:self.preView];
}

- (void) resetView{
    [UIView beginAnimations:@"resetView" context:nil];
    [UIView setAnimationDuration:1];
    if (self.seq != 1) {
        self.preView.center = CGPointMake(self.view.center.x - self.view.frame.size.width, self.view.center.y);
    }
    if (self.seq != 100) {
        self.nextView.center = CGPointMake(self.view.center.x + self.view.frame.size.width, self.view.center.y);
    }
    self.visitedView.center = self.view.center;
    [UIView commitAnimations];
}

- (void) moveViewWithTranslation:(CGPoint)translation{
    if (translation.x>0) {
        if(self.seq == 1 ) {
            [[[UIAlertView alloc] initWithTitle:nil message:@"已经是第一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
            return;
        }else{
            self.preView.center =CGPointMake(self.visitedView.center.x+translation.x, self.visitedView.center.y);
        }
    }
    if (translation.x <0) {
        if (self.seq == 100) {
            [[[UIAlertView alloc] initWithTitle:nil message:@"已经是最后一题" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
            return;
        }else{
            self.nextView.center = CGPointMake(self.visitedView.center.x+translation.x, self.visitedView.center.y);
        }
    }
    self.visitedView.center = CGPointMake(self.visitedView.center.x+translation.x, self.visitedView.center.y);
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
