//
//  InterClassSummaryTableViewCell.h
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/28/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterClassSummaryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *signningNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *certificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


@end
