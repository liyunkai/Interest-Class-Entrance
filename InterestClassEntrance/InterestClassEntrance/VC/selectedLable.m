//
//  selectedLable.m
//  InterestClassEntrance
//
//  Created by 九分青睐 on 15/3/19.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import "selectedLable.h"

@implementation selectedLable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if(self){
        self.text = @"外向";
        [self setFrame:CGRectMake(30, 80, 35, 20)];
//        [self setBackgroundColor:[UIColor greenColor]];
        [self setUserInteractionEnabled:YES];
        UITapGestureRecognizer *TapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selected)];
        [self addGestureRecognizer:TapGestureRecognizer];
        
        self.isSelected = NO;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-5, -0.5*self.frame.size.height, 15, 15)];
//        [self.imageView setBackgroundColor:[UIColor redColor]];
//        CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        [self.imageView setImage:[UIImage imageNamed:@"selected.png"]];
        [self.imageView setHidden:YES];
        [self addSubview:self.imageView];

    }
    return self;
}

-(void)selected{
    self.isSelected = !self.isSelected;
//    NSLog(@"%d",self.isSelected);
    if (self.isSelected) {
        [self.imageView setHidden:NO];
    }
    else{
        [self.imageView setHidden:YES];
    }
}

-(void)setPosition:(float)x :(float)y{
    CGRect frame = self.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    self.frame = frame;
}
@end
