//
//  ViewController.m
//  HorizontalCollectionCellExample
//
//  Created by Muratcan Celayir on 1.02.2015.
//  Copyright (c) 2015 Muratcan Celayir. All rights reserved.
//

#import "InterestCategoryViewController.h"
#import "HorizontalScrollCell.h"
@interface InterestCategoryViewController ()<HorizontalScrollCellDelegate>

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
        
    [hsc setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.5f]];
    
    [hsc setUpCellWithArray:[self.interestCategInfo imgArrayForRowAtIndex:indexPath.row]];
    
    [hsc.scroll setFrame:CGRectMake(hsc.scroll.frame.origin.x, hsc.scroll.frame.origin.y, hsc.frame.size.width, 164)];
    
    hsc.cellDelegate = self;
    
    return hsc;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize retval = CGSizeMake(self.view.frame.size.width - 10, 200);
    
    return retval;
}

-(void)cellSelected
{
    NSLog(@"Selected !!");
}

@end


@implementation InterestCategoryClass

-(id)init{
    self = [super init];
    if (self) {
        self->columArr[0] = 4;
        self->columArr[1] = 4;
        self->columArr[2] = 4;
        self->columArr[3] = 4;
    }
    return self;
}

-(NSArray *)imgArrayForRowAtIndex:(char)rowIndex{
    if(rowIndex>=0 && rowIndex<INTEREST_CATEGORY_ROW){
        NSMutableArray *imgArr = [[NSMutableArray alloc] init];
        for (int i =0; i<self->columArr[rowIndex]; ++i) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"InterCateg0_img%d",i]];
            if (img) {
                [imgArr addObject:img];
            }else{
                img = [UIImage imageNamed:@"photo"];
                [imgArr addObject:img];
            }
        }
        return [[NSArray alloc] initWithArray:imgArr];
    }
    return nil;
}

@end