//
//  InterClassListViewController.h
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/28/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterestClassSummary.h"

@interface InterClassListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *interestClassList;
@property(nonatomic,strong)NSString *uiDescription;

@end
