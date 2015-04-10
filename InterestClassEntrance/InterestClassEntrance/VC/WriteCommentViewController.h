//
//  WriteCommentViewController.h
//  InterestClassEntrance
//
//  Created by 邓翔 on 15/4/9.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteCommentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

- (IBAction)dismiss:(UIBarButtonItem *)sender;

@end
