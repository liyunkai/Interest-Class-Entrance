//
//  InterClassListViewController.m
//  InterestClassEntrance
//
//  Created by 李允恺 on 3/28/15.
//  Copyright (c) 2015 李允恺. All rights reserved.
//

#import "InterClassListViewController.h"
#import "InterClassSummaryTableViewCell.h"

@interface InterClassListViewController ()

@end

@implementation InterClassListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTestData];
}

- (void)setupTestData{

    self.title = @"古筝";
    self.interestClassList = [[NSMutableArray alloc] init];
    InterestClassSummary *oneInterClassSummary;
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"启明兴趣班" SigNum:2048 commentNum:911 headImage:nil price:200 certification:@"机构认证" address:@"湖北省武汉市洪山区华中科技大学启明学院"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"雨果琴韵文化会所" SigNum:1400 commentNum:78 headImage:nil price:300 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:nil price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.interestClassList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InterClassSummaryTableViewCell *cell;
    cell = (InterClassSummaryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cellInterClassSummary" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[InterClassSummaryTableViewCell alloc] init];
    }
    InterestClassSummary *oneInterClassSummary = [self.interestClassList objectAtIndex:indexPath.row];
    cell.nameLabel.text = oneInterClassSummary.name;
    cell.signningNumLabel.text = [NSString stringWithFormat:@"%ld人报名",(long)(oneInterClassSummary.signingNum)];
    cell.commentNumLabel.text = [NSString stringWithFormat:@"%ld条评论",(long)(oneInterClassSummary.commentNum)];
    cell.headImageView.image = oneInterClassSummary.headImage;
    cell.priceLabel.text = [NSString stringWithFormat:@"价格 %ld元起",(long)(oneInterClassSummary.price)];
    cell.certificationLabel.text = @"机构认证";
    cell.addressLabel.text = oneInterClassSummary.address;

    return cell;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"最近的";
//}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"segueToInterClassDetail" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */







#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
