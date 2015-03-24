//
//  ReportViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "ReportViewController.h"
#import "ASProgressPopUpView.h"

@interface ReportViewController ()

@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView1;
@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView2;
@property (weak, nonatomic) IBOutlet ASProgressPopUpView *progressView3;



@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgColor = [UIImage imageNamed:@"beijing.png"];
    self.view.layer.contents = (id)bgColor.CGImage;
    
    self.progressView1.popUpViewCornerRadius = 12;
    self.progressView1.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    self.progressView1.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView1 setProgress:0.9 animated:YES];
    [self.progressView1 showPopUpViewAnimated:YES];
    
    self.progressView2.popUpViewCornerRadius = 12.0;
    self.progressView2.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    self.progressView2.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView2 setProgress:0.8 animated:YES];
    [self.progressView2 showPopUpViewAnimated:YES];
    
    self.progressView3.popUpViewCornerRadius = 12.0;
    self.progressView3.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    self.progressView3.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView3 setProgress:0.6 animated:YES];
    [self.progressView3 showPopUpViewAnimated:YES];

}


// <ASProgressPopUpViewDataSource> is entirely optional
// it allows you to supply custom NSStrings to ASProgressPopUpView
- (NSString *)progressView:(ASProgressPopUpView *)progressView stringForProgress:(float)progress
{
    NSString *s;
    if (progress < 0.2) {
        s = @"Just starting";
    } else if (progress > 0.4 && progress < 0.6) {
        s = @"About halfway";
    } else if (progress > 0.75 && progress < 1.0) {
        s = @"Nearly there";
    } else if (progress >= 1.0) {
        s = @"Complete";
    }
    return s;
}

// by default ASProgressPopUpView precalculates the largest popUpView size needed
// it then uses this size for all values and maintains a consistent size
// if you want the popUpView size to adapt as values change then return 'NO'
- (BOOL)progressViewShouldPreCalculatePopUpViewSize:(ASProgressPopUpView *)progressView;
{
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)quit:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
