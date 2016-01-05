//
//  ViewController.m
//  瀑布流
//
//  Created by Mr.Deng on 16/1/4.
//  Copyright © 2016年 Mr.Deng. All rights reserved.
//

#import "ViewController.h"
#import "DJCell.h"
#import "DDCollectionViewFlowLayout.H"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, DDCollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *numArray;

@property (nonatomic, strong) NSMutableArray *heightArr;

@property (nonatomic, strong) DDCollectionViewFlowLayout *flowLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numArray = [NSMutableArray array];
    
    self.heightArr = [NSMutableArray array];
    
    self.flowLayout = [[DDCollectionViewFlowLayout alloc] init];
    self.flowLayout.delegate = self;
    [self.collectionView setCollectionViewLayout:self.flowLayout animated:YES];
    
    for (int i = 0; i < 30; i++) {
        [self.numArray addObject:[NSString stringWithFormat:@"%zd", i+1]];
        CGFloat height = 30 + (arc4random()%100);
        [self.heightArr addObject:[NSString stringWithFormat:@"%f",height]];
    }
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DJCell" bundle:nil] forCellWithReuseIdentifier:@"DJCell"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.numArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"DJCell";
    DJCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //模型传递,给cell赋值
    cell.textLabel.text = self.numArray[indexPath.row];
    
    return cell;
}


#pragma mark - UICollectionView Delegate Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(DDCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section{
    return 3;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //return CGSizeMake(100, 100 + indexPath.item *10);
    CGFloat height = [[self.heightArr objectAtIndex:indexPath.row] floatValue];
    return CGSizeMake(100, height);
}


@end
