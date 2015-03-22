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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set background image
    UIImage *bgImage = [UIImage imageNamed:@"bgImage.png"];
    self.view.layer.contents = (id)(bgImage.CGImage);
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //segmentedControl size
    CGRect frame = self.sex.frame;
    [self.sex setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 100)];

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
@end
