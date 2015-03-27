//
//  ChildInfoViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "ChildInfoViewController.h"
#import "characterLable.h"

@interface ChildInfoViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (strong, nonatomic)UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet characterLable *huoPo;
@property (strong, nonatomic) IBOutlet characterLable *anJing;
@property (strong, nonatomic) IBOutlet characterLable *kaiLang;
@property (strong, nonatomic) IBOutlet characterLable *neiXiang;

- (IBAction)sexChanged:(id)sender;
@end

@implementation ChildInfoViewController

-(void)viewDidAppear:(BOOL)animated{
    //Calling this methods builds the intro and adds it to the screen. See below.
    self.navigationController.navigationBarHidden =YES;
    [self buildIntro];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set background image
    UIImage *bgImage = [UIImage imageNamed:@"bgImage.png"];
    self.view.layer.contents = (id)(bgImage.CGImage);
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //segmentedControl size
//    CGRect frame = self.sex.frame;
//    [self.sex setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 100)];

    //enable lable user interaction
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDatePicker)];
    [self.birthday setUserInteractionEnabled:YES];
    [self.birthday addGestureRecognizer:tapGesture];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormater setTimeZone:timeZone];
    [dateFormater setDateFormat:@"yyyy/MM/dd"];
    self.birthday.text = [dateFormater stringFromDate:[NSDate date]];
    
    [self.huoPo enable];
    [self.kaiLang enable];
    [self.anJing enable];
    [self.neiXiang enable];
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

- (IBAction)sexChanged:(id)sender {
    NSLog(@"%@", [self.sex titleForSegmentAtIndex:self.sex.selectedSegmentIndex]);
    
}

-(void)showDatePicker{
    UIAlertView *alertView  = [[UIAlertView alloc] initWithTitle:@"选择生日" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    self.datePicker = [[UIDatePicker alloc] init];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    [self.datePicker setMaximumDate:[NSDate date]];
    [self.datePicker addTarget:self action:@selector(changeBirthday) forControlEvents:UIControlEventValueChanged];
    [alertView setValue:self.datePicker forKey:@"accessoryView"];
    [alertView show];
}

-(void)changeBirthday{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormater setTimeZone:timeZone];
    [dateFormater setDateFormat:@"yyyy/MM/dd"];
    self.birthday.text = [dateFormater stringFromDate:[self.datePicker date]];
    
}

#pragma mark - Build MYBlurIntroductionView

-(void)buildIntro{
    //Create Stock Panel with header
//    UIView *headerView = [[NSBundle mainBundle] loadNibNamed:@"TestHeader" owner:nil options:nil][0];
    MYIntroductionPanel *panel0 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPage0"];
    
    //Create Stock Panel With Image
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPage1"];
    
    //Create Panel From Nib
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPage2"];
    
    //Create custom panel with events
    MYIntroductionPanel *panel3 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPage3"];
    
    //Add panels to an array
    NSArray *panels = @[panel0, panel1, panel2, panel3];
    
    //Create the introduction view and set its delegate
    MYBlurIntroductionView *introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;
//    introductionView.BackgroundImageView.image = [UIImage imageNamed:@"Toronto, ON.jpg"];
    //introductionView.LanguageDirection = MYLanguageDirectionRightToLeft;
    
    //Build the introduction with desired panels
    [introductionView buildIntroductionWithPanels:panels];
    
    //Add the introduction to your view
    [self.view addSubview:introductionView];
}

#pragma mark - MYIntroduction Delegate

-(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex{
    NSLog(@"Introduction did change to panel %ld", (long)panelIndex);
    
    //You can edit introduction view properties right from the delegate method!
    //If it is the first panel, change the color to green!
    if (panelIndex == 0) {
        [introductionView setBackgroundColor:[UIColor colorWithRed:90.0f/255.0f green:175.0f/255.0f blue:113.0f/255.0f alpha:1]];
    }
    //If it is the second panel, change the color to blue!
    else if (panelIndex == 1){
        [introductionView setBackgroundColor:[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:1]];
    }
    
}

-(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType {
    NSLog(@"Introduction did finish");
    self.navigationController.navigationBarHidden =NO;
}






@end
