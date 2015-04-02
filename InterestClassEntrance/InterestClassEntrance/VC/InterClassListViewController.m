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
    UIImage *img = [UIImage imageNamed:@"InterClassList_img0"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"艺乐艺术培训中心" SigNum:189 commentNum:43 headImage:img price:400 certification:@"机构认证" address:@"光谷天地长城坐标城A4栋2单元101室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img1"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"雨果琴韵文化会所" SigNum:1400 commentNum:78 headImage:img price:300 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img2"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"武汉市洪山区木声琴行" SigNum:250 commentNum:24 headImage:img price:500 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img3"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"武汉市洪山区华逸琴行" SigNum:73 commentNum:53 headImage:img price:800 certification:@"机构认证" address:@"武汉市洪山区元宝山市场"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img4"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"汉阳优哆国际艺术培训工作室" SigNum:43 commentNum:12 headImage:img price:500 certification:@"机构认证" address:@"汉阳钟家村马鹦路姚湾广电兰亭都荟5栋二单元2101室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img5"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"巴洛克艺术培训中心" SigNum:234 commentNum:45 headImage:img price:600 certification:@"机构认证" address:@"武汉武昌区南湖平安路雪香花园"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img6"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"音乐花园艺术培训中心" SigNum:250 commentNum:105 headImage:img price:250 certification:@"机构认证" address:@"江岸区车站路长青广场"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img6"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"广墨缘古琴古筝培训" SigNum:250 commentNum:105 headImage:img price:250 certification:@"机构认证" address:@"武汉市江岸区解放公园中华名塔园内"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img7"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:img price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img8"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:img price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img9"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:img price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
    img = [UIImage imageNamed:@"InterClassList_img10"];
    oneInterClassSummary = [[InterestClassSummary alloc] initWithName:@"少年宫文艺部" SigNum:250 commentNum:105 headImage:img price:250 certification:@"机构认证" address:@"东湖高新区珞瑜东路柏景阁1-1128室"];
    [self.interestClassList addObject:oneInterClassSummary];
    oneInterClassSummary = nil;
    img = nil;
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
