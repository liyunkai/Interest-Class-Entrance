//
//  ViewController.m
//  HTHorizontalSelectionList Example
//
//  Created by Erik Ackermann on 9/14/14.
//  Copyright (c) 2014 Hightower. All rights reserved.
//

#import "InterClassDetailViewController.h"
#import "HTHorizontalSelectionList.h"

#import <AVOSCloud/AVOSCloud.h>

@interface InterClassDetailViewController () <HTHorizontalSelectionListDelegate, HTHorizontalSelectionListDataSource>

@property (nonatomic, strong) HTHorizontalSelectionList *textSelectionList;
@property (nonatomic, strong) NSArray *detailMakes;
@property(nonatomic, assign) NSInteger selectedListItemIndex;
@property (nonatomic, strong) UILabel *selectedDetailLabel;

/* 演示用数据 */
@property(nonatomic, strong) NSArray *teacherInfoList;
@property(nonatomic, strong) NSArray *commentList;
@property(nonatomic, strong) NSArray *lessonList;

@end

@implementation InterClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHorizonSelectionList];
    [self setupTestData];
}

- (void)setupTestData{
    self.title = @"雨果琴韵文化会所";
    self.teacherInfoList = @[@"刘雨果:  当代古筝专业演奏家，雨果琴韵文化会所创办人，多次参加国内外民乐演出，并担任古筝独奏。国际古筝协会会员，中国民族器乐协会会员，中国东方乐团古筝演奏员；中国音乐家协会、武汉音乐家协会会员，并获古筝大师资格证和中央音乐学院高级教师资格证，从师于当代中国杰出古筝表演艺术家袁莎、国家一级作曲（正教授级专业技术职称）、新筝艺术之父、王派筝法创始人王天一、国家一级演员新筝艺术大师赵勃楠。曾受中国文化部和国家有关部门派遣，先后到10多个国家和地区进行访问演出，形成了重大国际影响，为祖国赢得了荣誉。",
                             @"徐雯煊:  6岁开始学习古筝，从武汉音乐学院副教授吴青老师老师。参加两岸台海杯音乐大赛．艺术节斩获银奖；参加由（香港）国际艺术专业等级评判协会 、中国音乐学院考级委员会、中国国际艺术文化协会主办的东方艺术盛典香港国际青少年艺术节并荣获古筝组金奖。并有多年从事古筝教育工作经验。",
                             @"王晓惜:  8岁跟随启蒙老师开始学习古筝，10岁考入武汉音乐学院附小师从中央音乐学院王运老师学习古筝。经过3年系统学习，以优异成绩考入武汉音乐学院附中成为2004级音乐表演（古筝方向）学生。在武汉音乐附中4年跟随高雁教授，吴青副教授学习。其间向徐守成大师学习过潮州筝曲。2010年考入武汉音乐学院，善于演奏山东，潮州，客家筝派筝曲和创作型乐曲与古筝协奏曲。研究古筝基础教育，古典曲目的感情表达和古筝高级技巧演奏.",
                             @"陈梦琪:  武汉知名古琴青年教师，拥有丰富的表演经验，从教多年，拥有丰富的古琴教学经验.8岁跟随启蒙老师开始学习古筝，10岁考入武汉音乐学院附小师从中央音乐学院王运老师学习古筝。经过3年系统学习，以优异成绩考入武汉音乐学院附中成为2004级音乐表演（古筝方向）学生。在武汉音乐附中4年跟随高雁教授，吴青副教授学习。其间向徐守成大师学习过潮州筝曲。2010年考入武汉音乐学院，善于演奏山东，潮州，客家筝派筝曲和创作型乐曲与古筝协奏曲。研究古筝基础教育，古典曲目的感情表达和古筝高级技巧演奏。"];
    self.commentList = @[@"[浮生若梦]：hello world 任我行",@"[猜猜我是谁]：你肯定猜不到"];
    self.lessonList = @[@" 古筝(小班) : 800元/期",@"古筝（1对1）: 80元/小时",@"古琴（小班） :  800元/期", @"古琴（1对1）:  80元/小时"];
    
    
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];

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

#define INTRO_INDEX 0
#define COMMENT_INDEX 3
#define TEACHER_INDEX  1
#define LESSON_INDEX  2

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (self.selectedListItemIndex) {
        case INTRO_INDEX:
        {
            return 1;
            break;
        }
        case COMMENT_INDEX:{
            return [self.commentList count];
            break;
        }
        case TEACHER_INDEX:{
            return [self.teacherInfoList count];
            break;
        }
        case LESSON_INDEX:{
            return [self.lessonList count];
            break;
        }
        default:{
            return 6;
            break;
        }
            
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // fixed font style. use custom view (UILabel) if you want something different
    return self.detailMakes[self.selectedListItemIndex];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.selectedListItemIndex) {
        case INTRO_INDEX:
        {
            return 200;
            break;
        }
        case COMMENT_INDEX:{
            return 44;
            break;
        }
        case TEACHER_INDEX:{
            return 200;
            break;
        }
        case LESSON_INDEX:{
            return 44;
            break;
        }
        default:{
            return 44;
            break;
        }
            
    }

    
    
    return 1.0f;
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
             cell.textLabel.text = @"武汉雨果琴韵文化会所（武汉雨果琴韵文化传播有限公司）　于2012年注册并由刘雨果女士创办，是一所集古筝、古琴、茶道、香道、花道、沙画等培训、考级，演出交流、国学传播、乐器销售为一体的综合性艺术文化机构。中国文化艺术交流理事单位，中国音乐学院、武汉音乐学院考级单位，《中华古韵网》创办单位；开办以来在社会上形成了颇为广泛的影响力，且打造了一定的知名度。拥有“专业的师资力量，优雅的教学环境，高效规范的管理，顶级专业的服务”。除了定期举办音乐比赛、公益性演出，还推荐优秀学员参加各类演出游学交流活动，给每一位学员及中国民族文化爱好者，提供一个提高自我、展示自我的舞台。";
             
             return cell;
             break;
         }
         case COMMENT_INDEX:{
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = [self.commentList objectAtIndex:indexPath.row];
             
             return cell;
             break;
         }
         case TEACHER_INDEX:{
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teacherInfoCell" forIndexPath:indexPath];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = [self.teacherInfoList objectAtIndex:indexPath.row];
             
             return cell;
             break;
         }
         case LESSON_INDEX:{
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lessonInfoCell" forIndexPath:indexPath];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] init];
             }
             cell.textLabel.text = [self.lessonList objectAtIndex:indexPath.row];
             
             
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
