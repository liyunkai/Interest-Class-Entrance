//
//  ViewController.m
//  HTHorizontalSelectionList Example
//
//  Created by Erik Ackermann on 9/14/14.
//  Copyright (c) 2014 Hightower. All rights reserved.
//

#import "InterClassDetailViewController.h"
#import "HTHorizontalSelectionList.h"

@interface InterClassDetailViewController () <HTHorizontalSelectionListDelegate, HTHorizontalSelectionListDataSource>

@property (nonatomic, strong) HTHorizontalSelectionList *textSelectionList;
//@property (weak, nonatomic) IBOutlet HTHorizontalSelectionList *textSelectionList;
@property (nonatomic, strong) NSArray *carMakes;

@property (nonatomic, strong) UILabel *selectedCarLabel;

@end

@implementation InterClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHorizonSelectionList];
}

- (void)setupHorizonSelectionList{
    //    self.title = @"Cars";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGRect refTopImgFrame = self.topImageView.frame;
    self.topImageView.image = nil;
    NSLog(@"%f",refTopImgFrame.origin.y);
    NSLog(@"%f",refTopImgFrame.size.height);
//    self.textSelectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, refTopImgFrame.size.height-20, self.view.frame.size.width, 40)];
    
    self.textSelectionList = [[HTHorizontalSelectionList alloc] init];
    self.textSelectionList.backgroundColor = [UIColor redColor];
//    self.textSelectionList.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    
    self.textSelectionList.delegate = self;
    self.textSelectionList.dataSource = self;
    
    self.textSelectionList.selectionIndicatorColor = [UIColor redColor];
    [self.textSelectionList setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    self.carMakes = @[@"机构信息",
                      @"师资力量",
                      @"课程设计",
                      @"家长评价",
                      @"作品展示",
                      @"啥啥啥",
                      @"不知道写什么了"];
    
    [self.view addSubview:self.textSelectionList];
    self.selectedCarLabel = [[UILabel alloc] init];
    self.selectedCarLabel.text = self.carMakes[self.textSelectionList.selectedButtonIndex];
//    self.selectedCarLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.selectedCarLabel];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textSelectionList
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topImageView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textSelectionList
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeLeft
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textSelectionList
//                                                          attribute:NSLayoutAttributeRight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeRight
//                                                         multiplier:1.0
//                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textSelectionList
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:40.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textSelectionList
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.selectedCarLabel
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.selectedCarLabel
//                                                          attribute:NSLayoutAttributeCenterY
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterY
//                                                         multiplier:1.0
//                                                           constant:0.0]];
}

#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods

- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    return self.carMakes.count;
}

- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index {
    return self.carMakes[index];
}

#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    // update the view for the corresponding index
    self.selectedCarLabel.text = self.carMakes[index];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
     
 }
 




@end
