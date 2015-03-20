//
//  QuestionView.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/18/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "QuestionView.h"

@implementation QuestionView

- (void)configQuestion{
    
}

-(void)awakeFromNib{
    [[NSBundle mainBundle] loadNibNamed:@"QuestionUIView" owner:self options:nil];
    [self addSubview:self.view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}
*/

@end
