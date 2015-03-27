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
@property (strong, nonatomic) IBOutlet ASProgressPopUpView *progressView4;
@property (strong, nonatomic) IBOutlet ASProgressPopUpView *progressView5;
@property (strong, nonatomic) IBOutlet ASProgressPopUpView *progressView6;
@property (strong, nonatomic) IBOutlet ASProgressPopUpView *progressView7;



@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgColor = [UIImage imageNamed:@"beijing.png"];
    self.view.layer.contents = (id)bgColor.CGImage;
    [self progressViewInit];
    NSLog(@"%d",self.gress[0]);
}

-(void)progressViewInit{
    self.progressView1.popUpViewCornerRadius = 12;
    //    UIColor *color1 = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.png"]];
    self.progressView1.popUpViewAnimatedColors = @[[UIColor brownColor]];
    self.progressView1.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView1 setProgress:self.gress[0]/100.0 animated:YES];
    [self.progressView1 showPopUpViewAnimated:YES];
    
    self.progressView2.popUpViewCornerRadius = 12.0;
    self.progressView2.popUpViewAnimatedColors = @[[UIColor blueColor]];
    self.progressView2.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView2 setProgress:self.gress[1]/100.0 animated:YES];
    [self.progressView2 showPopUpViewAnimated:YES];
    //
    self.progressView3.popUpViewCornerRadius = 12.0;
    self.progressView3.popUpViewAnimatedColors = @[[UIColor brownColor]];
    self.progressView3.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView3 setProgress:self.gress[2]/100.0 animated:YES];
    [self.progressView3 showPopUpViewAnimated:YES];
    //
    self.progressView4.popUpViewCornerRadius = 12.0;
    self.progressView4.popUpViewAnimatedColors = @[[UIColor grayColor]];
    self.progressView4.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView4 setProgress:self.gress[3]/100.0 animated:YES];
    [self.progressView4 showPopUpViewAnimated:YES];
    
    self.progressView5.popUpViewCornerRadius = 12.0;
    self.progressView5.popUpViewAnimatedColors = @[[UIColor orangeColor]];
    self.progressView5.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView5 setProgress:self.gress[4]/100.0 animated:YES];
    [self.progressView5 showPopUpViewAnimated:YES];
    
    self.progressView6.popUpViewCornerRadius = 12.0;
    self.progressView6.popUpViewAnimatedColors = @[[UIColor yellowColor]];
    self.progressView6.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView6 setProgress:self.gress[5]/100.0 animated:YES];
    [self.progressView6 showPopUpViewAnimated:YES];
    
    self.progressView7.popUpViewCornerRadius = 12.0;
    self.progressView7.popUpViewAnimatedColors = @[[UIColor greenColor]];
    self.progressView7.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:15];
    [self.progressView7 setProgress:self.gress[6]/100.0 animated:YES];
    [self.progressView7 showPopUpViewAnimated:YES];
    
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
    if (((UIView *)sender).tag == 2) {
        return;
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
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
