//
//  characterLable.m
//  InterestClassEntrance
//
//  Created by 九分青睐 on 15/3/22.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import "characterLable.h"

@implementation characterLable

-(void)enable{
    self.isSelected = NO;
    
    self.imageView  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected.png"]];
    [self.imageView setFrame:CGRectMake(0.8*self.frame.size.width, -0.4*self.frame.size.height, 15, 15)];
    [self.imageView setHidden:YES];
    [self addSubview:self.imageView];
    
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGuestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapGuestureRecognizer addTarget:self action:@selector(selectCharacter)];
    [self addGestureRecognizer:tapGuestureRecognizer];
    
}

-(void)selectCharacter{
    self.isSelected = !self.isSelected;
    if (self.isSelected) {
        [self.imageView setHidden:NO];
    }else{
        [self.imageView setHidden:YES];
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
