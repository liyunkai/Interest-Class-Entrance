//
//  InterClassSummaryTableViewCell.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/28/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "InterClassSummaryTableViewCell.h"

@implementation InterClassSummaryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.headImageView.layer.cornerRadius = 25;
    self.headImageView.layer.shadowRadius = 5;
    self.headImageView.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
