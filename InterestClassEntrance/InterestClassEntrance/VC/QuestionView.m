//
//  QuestionView.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/18/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "QuestionView.h"

@implementation QuestionView

- (void)configQuestion:(dataSou *)question btnIndex:(int)btnIndex{
    if (question) {
        [self viewSelectedAtIndex:btnIndex];
        self.labelQuiz.text = question.item;
        self.labelA.text = question.optionA;
        self.labelB.text = question.optionB;
        self.labelC.text = question.optionC;
        self.labelD.text = question.optionD;
        if(question.optionA.length == 0){
            [self.labelAImgView setHidden:YES];
            [(UIButton *)[self viewWithTag:1] setHidden:YES];
        }
        if(question.optionB.length == 0){
            [self.labelBImgView setHidden:YES];
            [(UIButton *)[self viewWithTag:2] setHidden:YES];
        }

        if(question.optionC.length == 0){
            [self.labelCImgView setHidden:YES];
            [(UIButton *)[self viewWithTag:3] setHidden:YES];
        }

        if(question.optionD.length == 0){
            [self.labelDImgView setHidden:YES];
            [(UIButton *)[self viewWithTag:4] setHidden:YES];
        }
    }
}

-(void)awakeFromNib{
    [[NSBundle mainBundle] loadNibNamed:@"QuestionUIView" owner:self options:nil];
    [self addSubview:self.view];
}

- (IBAction)touchDown:(id)sender{
    UIButton *downBtn = (UIButton *)sender;
    [self.delegate handleBtnIndex:downBtn.tag];
    [self viewSelectedAtIndex:downBtn.tag];
}

/* 将view改变为选中状态 */
- (void)viewSelectedAtIndex:(NSInteger)index{
    //设置未选中状态的view
    for (int i=5; i<=8; i++) {
        UIImageView *backBlue = (UIImageView *)[self viewWithTag:i];
        if (backBlue) {
            [backBlue setHidden:YES];
        }
    }
    self.labelAImgView.image = [UIImage imageNamed:@"Test_A"];
    self.labelBImgView.image = [UIImage imageNamed:@"Test_B"];
    self.labelCImgView.image = [UIImage imageNamed:@"Test_C"];
    self.labelDImgView.image = [UIImage imageNamed:@"Test_D"];
    //
    //入口断言
    if (index<1|| index>4) {
        return;
    }else{//设置选中状态的view
        UIImageView *blackBlue = (UIImageView *)[self viewWithTag:index+4];
        [blackBlue setHidden:NO];
        if (index == 1) {
            self.labelAImgView.image = [UIImage imageNamed:@"Test_A-"];
        }
        if (index == 2) {
            self.labelBImgView.image = [UIImage imageNamed:@"Test_B-"];
        }
        if (index == 3) {
            self.labelCImgView.image = [UIImage imageNamed:@"Test_C-"];
        }
        if (index == 4) {
            self.labelDImgView.image = [UIImage imageNamed:@"Test_D-"];
        }
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}
*/

@end
