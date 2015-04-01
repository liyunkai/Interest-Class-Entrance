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
@property (nonatomic, strong) NSArray *detailMakes;

@property (nonatomic, strong) UILabel *selectedDetailLabel;

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
    NSLog(@"%f",refTopImgFrame.origin.y);
    NSLog(@"%f",refTopImgFrame.size.height);
    self.textSelectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, refTopImgFrame.size.height-20, self.view.frame.size.width, 40)];
    self.textSelectionList.delegate = self;
    self.textSelectionList.dataSource = self;
    
    self.textSelectionList.selectionIndicatorColor = [UIColor redColor];
    [self.textSelectionList setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    self.detailMakes = @[@"机构信息",
                      @"师资力量",
                      @"课程设计",
                      @"家长评价",
                      @"作品展示",
                      @"啥啥啥",
                      @"不知道写什么了"];
    
    [self.view addSubview:self.textSelectionList];
    self.selectedDetailLabel = [[UILabel alloc] init];
    self.selectedDetailLabel.text = self.detailMakes[self.textSelectionList.selectedButtonIndex];
    self.selectedDetailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.selectedDetailLabel];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.selectedDetailLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.selectedDetailLabel
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
}

#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods

- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    return self.detailMakes.count;
}

- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index {
    return self.detailMakes[index];
}

#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    // update the view for the corresponding index
    self.selectedDetailLabel.text = self.detailMakes[index];
    [self.detailTableView reloadData];
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
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introCell" forIndexPath:indexPath];
 // Configure the cell...
     if (cell == nil) {
         cell = [[UITableViewCell alloc] init];
     }
     cell.textLabel.text = @"机构介绍";
     cell.detailTextLabel.text = @"成立于XX年";
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
