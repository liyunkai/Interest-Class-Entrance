//
//  ViewController.m
//  HorizontalCollectionCellExample
//
//  Created by Muratcan Celayir on 1.02.2015.
//  Copyright (c) 2015 Muratcan Celayir. All rights reserved.
//

#import "InterestCategoryViewController.h"
#import "HorizontalScrollCell.h"
#import "InterestCategoryClass.h"

@interface InterestCategoryViewController ()<HorizontalScrollCellDelegate>

@property(nonatomic,strong) NSString *selectedInfo;

@end

@implementation InterestCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.interestCategInfo = [[InterestCategoryClass alloc] init];
    [self setUpCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpCollection
{
    self.collection.delegate = self;
    self.collection.dataSource = self;
    
    UINib *hsCellNib = [UINib nibWithNibName:@"HorizontalScrollCell" bundle:nil];
    [self.collection registerNib:hsCellNib forCellWithReuseIdentifier:@"cvcHsc"];
    
    [self.collection reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return INTEREST_CATEGORY_ROW;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HorizontalScrollCell *hsc =[collectionView dequeueReusableCellWithReuseIdentifier:@"cvcHsc"
                                                                         forIndexPath:indexPath];
        
//    [hsc setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.5f]];
    [hsc setBackgroundColor:[UIColor whiteColor]];
    
    [hsc setUpCellWithArray:[self.interestCategInfo imgArrayForRowAtIndex:indexPath.row] andRow:indexPath.row];
    
    hsc.title.text = [self.interestCategInfo.categNameArr objectAtIndex:indexPath.row];
    
    [hsc.scroll setFrame:CGRectMake(hsc.scroll.frame.origin.x, hsc.scroll.frame.origin.y, hsc.frame.size.width, 120)];
    
    hsc.cellDelegate = self;
    
    return hsc;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize retval = CGSizeMake(self.view.frame.size.width - 10, 150);
    
    return retval;
}

-(void)cellSelectedWithRow:(NSInteger)row Column:(NSInteger)column
{
    NSLog(@"Selected !! %ld, %ld",(long)row,(long)column);
    [self performSegueWithIdentifier:@"segueToInterClassList" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"segueToInterClassList"] == NSOrderedSame) {
        InterestCategoryViewController *desVC = segue.destinationViewController;
        //对兴趣班列表viewcontroller赋值，传递数据
    }
}




@end


