//
//  CommentTableViewCell.h
//  InterestClassEntrance
//
//  Created by 邓翔 on 15/4/8.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
