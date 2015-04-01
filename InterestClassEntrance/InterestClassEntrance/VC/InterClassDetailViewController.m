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
@property (nonatomic, strong) NSArray *detailMakes;
@property(nonatomic, assign) NSInteger selectedListItemIndex;
@property (nonatomic, strong) UILabel *selectedDetailLabel;

@end

@implementation InterClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHorizonSelectionList];
}

- (void)setupHorizonSelectionList{
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
    self.selectedListItemIndex = index;
    NSLog(@"%ld",(long)index);
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

#define INTRO_INDEX 0
#define COMMENT_INDEX 3
#define TEACHER_INDEX  1
#define LESSON_INDEX  2

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // fixed font style. use custom view (UILabel) if you want something different
    return self.detailMakes[self.selectedListItemIndex];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     switch (self.selectedListItemIndex) {
         case INTRO_INDEX:
         {
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introCell" forIndexPath:indexPath];
             // Configure the cell...
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = @"成立于XX年\nssssssssssssssssssssssssss\nsssssssssssssssssss\nssssssssssssssssss";
             
             
             return cell;
             break;
         }
         case COMMENT_INDEX:{
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = @"用户名：评论内容blablabla";
             
             
             return cell;
             break;
         }
         case TEACHER_INDEX:{
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teacherInfoCell" forIndexPath:indexPath];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = @"老师名字：介绍blabla";
             
             
             return cell;
             break;
         }
         case LESSON_INDEX:{
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lessonInfoCell" forIndexPath:indexPath];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = @"课程名：介绍blabla";
             
             
             return cell;
             break;
         }
             
         default:{
             UITableViewCell *cell = [[UITableViewCell alloc] init];
             
             
             return cell;
             break;
         }
             
             
     }
     
     
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
