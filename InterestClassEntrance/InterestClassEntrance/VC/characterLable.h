//
//  characterLable.h
//  InterestClassEntrance
//
//  Created by 九分青睐 on 15/3/22.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface characterLable : UILabel

@property (assign, nonatomic) BOOL isSelected;
@property (strong, nonatomic) UIImageView *imageView;
-(void)enable;

@end



