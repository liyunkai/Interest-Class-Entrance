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
        self.labelQuiz.text = question.item;
        self.labelA.text = question.optionA;
        self.labelB.text = question.optionB;
        self.labelC.text = question.optionC;
        self.labelD.text = question.optionD;
        [self viewSelectedAtIndex:btnIndex];
    }
}

-(void)awakeFromNib{
    [[NSBundle mainBundle] loadNibNamed:@"QuestionUIView" owner:self options:nil];
    [self addSubview:self.view];
}

- (IBAction)touchDown:(id)sender{
    NSLog(@"btn is touched down");
    UIButton *downBtn = (UIButton *)sender;
    [self.delegate handleBtnIndex:downBtn.tag];
    [self viewSelectedAtIndex:downBtn.tag];
}

/* 将view改变为选中状态 */
- (void)viewSelectedAtIndex:(NSInteger)index{
    //设置未选中状态的view
    for (NSInteger i=1; i<=4; ++i) {
        UIButton *otherBtn = (UIButton *)[self viewWithTag:i];
        [otherBtn setSelected:NO];
    }
    //入口断言
    if (index<1|| index>4) {
        return;
    }else{//设置选中状态的view
        UIButton *downBtn = (UIButton *)[self viewWithTag:index];
        if (downBtn) {
            [downBtn setSelected:YES];
        }
        //设置选中状态的view
        if (index == 1) {
            //self.labelAImgView.image = [UIImage imageNamed:<#(NSString *)#>]
            
        }
        if (index == 2) {
            
        }
        if (index == 3) {
            
        }
        if (index == 4) {
            
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
