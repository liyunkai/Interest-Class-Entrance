//
//  ChildInfoViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/17/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "ChildInfoViewController.h"
#import "checkedLable.h"
#import "selectedLable.h"
#import "ZDProgressView.h"

@interface ChildInfoViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;
- (IBAction)sexChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *birthday;

@property (strong, nonatomic)UIDatePicker *datePicker;
@end

@implementation ChildInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set background image
    UIImage *bgImage = [UIImage imageNamed:@"bgImage.png"];
    self.view.layer.contents = (id)(bgImage.CGImage);
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //enable lable user interaction
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDatePicker)];
    [self.birthday setUserInteractionEnabled:YES];
    [self.birthday addGestureRecognizer:tapGesture];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormater setTimeZone:timeZone];
    [dateFormater setDateFormat:@"yyyy/MM/dd"];
    self.birthday.text = [dateFormater stringFromDate:[NSDate date]];

    selectedLable *lable1 = [[selectedLable alloc] init];
//    lable1.backgroundColor = [UIColor redColor];
    [lable1 setPosition:60 :500];
    [self.view addSubview:lable1];
    
    selectedLable *lable2  = [[selectedLable alloc] init];
    [lable2 setPosition:120 :450];
    lable2.text = @"开朗";
    [self.view addSubview:lable2];
    
    selectedLable *lable3 = [[selectedLable alloc] init];
    [lable3 setPosition:100 :520];
    lable3.text = @"安静";
    [self.view addSubview:lable3];
    
    ZDProgressView *p = [[ZDProgressView alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    p.Progress = 0.5;
    //p.noColor = [UIColor greenColor];
    p.prsColor = [UIColor greenColor];
    p.borderWidth = 3;
    p.text = @"hello";
    //[p setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:p];
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
@end
