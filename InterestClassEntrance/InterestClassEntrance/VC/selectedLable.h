//
//  selectedLable.h
//  InterestClassEntrance
//
//  Created by 九分青睐 on 15/3/19.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectedLable : UILabel

@property BOOL isSelected;
@property (strong, nonatomic) UIImageView *imageView;

-(void)setPosition:(float)x :(float)y;

@end
