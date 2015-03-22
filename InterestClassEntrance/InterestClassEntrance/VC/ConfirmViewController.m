//
//  ConfirmViewController.m
//  InterestClassEntrance
//
//  Created by 九分青睐 on 15/3/18.
//  Copyright (c) 2015年 李允恺. All rights reserved.
//

#import "ConfirmViewController.h"

@interface ConfirmViewController ()
@property (weak, nonatomic) IBOutlet UITextView *explianation;

@end

@implementation ConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.explianation setUserInteractionEnabled:NO];
    UIImage *bgColor = [UIImage imageNamed:@"bg.png"];
    self.view.layer.contents = (id)bgColor.CGImage;
    
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

@end
