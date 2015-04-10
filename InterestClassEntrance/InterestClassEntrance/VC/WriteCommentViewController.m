//
//  WriteCommentViewController.m
//  InterestClassEntrance
//
//  Created by 邓翔 on 15/4/9.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import "WriteCommentViewController.h"

@interface WriteCommentViewController ()

@end

@implementation WriteCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.commentTextView becomeFirstResponder];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismiss:(UIBarButtonItem *)sender {
    if (sender.tag) {
        //点击发送
    } else {
        //点击取消
    }
    
    [self.commentTextView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
